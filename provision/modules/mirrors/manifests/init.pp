# == Class: mirrors
#
# This class installs the Extra Packages for Enterprise Linux (EPEL) repository
# and would be the place to configure any other custom mirrors you may want.
#
# === Parameters
#
# === Actions
#
# - Install EPEL repository using upstream RPM
#
# === Requires
#
# === Sample Usage
#
#   class { 'mirrors': }
#
class mirrors {

  package { 'epel-release':
    ensure   => installed,
    provider => rpm,
    source   => 'puppet:///modules/mirrors/epel-release-5-4.noarch.rpm',
  }

}
