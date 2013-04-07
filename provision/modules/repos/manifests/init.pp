# == Class: repos
#
# This class loads the relevant distribution-specific package repository
# manifests and would be the place to configure any other custom repos you
# may want.
#
# === Parameters
#
# === Actions
#
# === Requires
#
# === Sample Usage
#
#   class { 'repos': }
#
class repos {

  case $::osfamily {
    'redhat': {
      class { 'repos::yum': }
    }
    'debian': {
      class { 'repos::apt': }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by Puppet Sandbox on ${::operatingsystem}")
    }
  }

}
