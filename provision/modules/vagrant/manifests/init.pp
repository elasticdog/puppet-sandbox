# == Class: vagrant
#
# This class is the place to fix minor Vagrant environment issues that may crop
# up with different base boxes.
#
# === Parameters
#
# === Actions
#
# - Ensure puppet group exists in order to eliminate the following problem:
#   https://github.com/camptocamp/puppet-java/issues/4
#
# === Requires
#
# === Sample Usage
#
#   class { 'vagrant': }
#
class vagrant {

  group { 'puppet':
    ensure => present,
  }

}
