# == Class: puppet::apt_pin
#
# This class pins the Puppet packages so installing specific versions will work
# on Debian-based hosts.
#
# === Parameters
#
# [*version*]
#   Which version of the Puppet packages to pin. Required.
#
# === Actions
#
# - Pin the version of the Puppet packages via Apt
#
# === Requires
#
# === Sample Usage
#
#   class { 'puppet::apt_pin':
#     version => '3.1.0-1puppetlabs1',
#   }
#
class puppet::apt_pin(
  $version
) {

  file { 'puppet.pref':
    path    => '/etc/apt/preferences.d/puppet.pref',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('puppet/puppet_apt_pin.pref.erb')
  }

  # ensure the pinning file exists before packages are installed
  Class['puppet::apt_pin'] -> Package['puppet']
  if defined(Package['puppetmaster']) {
    Class['puppet::apt_pin'] -> Package['puppetmaster']
  }

}
