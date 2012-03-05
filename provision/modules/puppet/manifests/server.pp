# == Class: puppet::server
#
# This class installs and manages the Puppet server daemon. 
#
# === Parameters
#
# === Actions
#
# - Install Puppet server package
# - Ensure puppet-master daemon is running
# - Configure Puppet to use nodes.pp and modules from /vagrant directory
# - Configure Puppet to autosign puppet client certificate requests
#
# === Requires
#
# === Sample Usage
#
#   class { 'puppet::server': }
#
class puppet::server {

  package { 'puppet-server':
    ensure => latest,
  }

  file { 'puppet.conf':
    path    => '/etc/puppet/puppet.conf',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0644',
    source  => 'puppet:///modules/puppet/puppet.conf',
    require => Package[ 'puppet-server' ],
    notify  => Service[ 'puppet-server' ],
  }

  file { 'site.pp':
    path    => '/etc/puppet/manifests/site.pp',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0644',
    source  => 'puppet:///modules/puppet/site.pp',
    require => Package[ 'puppet-server' ],
  }

  file { '/etc/puppet/manifests/nodes.pp':
    ensure  => link,
    target  => '/vagrant/nodes.pp',
  }

  # initialize a template file then ignore
  file { '/vagrant/nodes.pp':
    ensure  => present,
    replace => false,
    source  => 'puppet:///modules/puppet/nodes.pp',
    require => Package[ 'puppet-server' ],
  }

  file { 'autosign.conf':
    path    => '/etc/puppet/autosign.conf',
    owner   => 'puppet',
    group   => 'puppet',
    mode    => '0644',
    content => '*',
    require => Package[ 'puppet-server' ],
  }

  service { 'puppet-server':
    enable => true,
    ensure => running,
    name   => 'puppetmaster',
  }

}
