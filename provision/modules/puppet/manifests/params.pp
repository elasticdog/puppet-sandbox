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

  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      $server_package_name = 'puppet-server'
    }
    'debian', 'ubuntu': {
      $server_package_name = 'puppetmaster'
    }
    default: {
      fail("Module 'puppet' is not currently supported by Puppet Sandbox on ${::operatingsystem}")
    }
  }

}
