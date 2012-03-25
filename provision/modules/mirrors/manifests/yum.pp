# == Class: mirrors::yum
#
# This class installs the Puppet Labs YUM repository.
#
# === Parameters
#
# === Actions
#
# - Install puppetlabs repository
# - Perform initial sync to update package database
#
# === Requires
#
# === Sample Usage
#
#   class { 'mirrors::yum': }
#
class mirrors::yum {

  # can't rely on $lsbmajdistrelease being available on CentOS, and lsb's
  # dependencies are huge, so don't force installation of the package
  $os_release_major_version = regsubst($operatingsystemrelease, '^(\d+).*$', '\1')

  file { 'puppetlabs.repo':
    ensure  => present,
    path    => '/etc/yum.repos.d/puppetlabs.repo',
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template('mirrors/puppetlabs.repo.erb'),
  }

  exec { 'yum_makecache':
    command     => '/usr/bin/yum makecache',
    subscribe   => File[ 'puppetlabs.repo' ],
    refreshonly => true,
  }

}
