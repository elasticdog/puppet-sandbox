# == Class: puppet::params
#
# This class manages the Puppet parameters.
#
# === Parameters
#
# === Actions
#
# === Requires
#
# === Sample Usage
#
# This class file is not called directly.
#
class puppet::params {

  $client_ensure = 'latest'
  $server_ensure = 'latest'

  case $::osfamily {
    'redhat': {
      $server_package_name = 'puppet-server'
    }
    'debian': {
      $server_package_name = 'puppetmaster'
    }
    default: {
      fail("Module 'puppet' is not currently supported by Puppet Sandbox on ${::operatingsystem}")
    }
  }

}
