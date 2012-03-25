# == Class: mirrors
#
# This class loads the relevant distribution-specific package repository
# manifests and would be the place to configure any other custom mirrors you
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
#   class { 'mirrors': }
#
class mirrors {

  case $::operatingsystem {
    'centos', 'fedora', 'redhat', 'scientific': {
      class { 'mirrors::yum': }
    }
    'debian', 'ubuntu': {
      class { 'mirrors::apt': }
    }
    default: {
      fail("Module '${module_name}' is not currently supported by Puppet Sandbox on ${::operatingsystem}")
    }
  }

}
