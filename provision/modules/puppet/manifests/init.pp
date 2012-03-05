# == Class: puppet
#
# This class installs and manages the Puppet client daemon.
#
# === Parameters
#
# === Actions
#
# - Install Puppet client package
# - Ensure puppet-agent daemon is running
#
# === Requires
#
# === Sample Usage
#
#   class { 'puppet': }
#
class puppet {

  package { 'puppet':
    ensure => latest,
  }

  service { 'puppet':
    enable => true,
    ensure => running,
  }

}
