# == Class: networking
#
# This class configures the hosts file to allow communication between the
# puppet master and puppet clients using the VirtualBox host-only network.
#
# === Parameters
#
# === Actions
#
# - Install custom hosts template
#
# === Requires
#
# === Sample Usage
#
#   class { 'networking': }
#
class networking {

  file { '/etc/hosts':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('networking/hosts.erb'),
  }

}
