#
# site.pp - defines defaults for vagrant provisioning
#

# use run stages for minor vagrant environment fixes
stage { 'pre': before => Stage['main'] }
class { 'mirrors': stage => 'pre' }

class { 'puppet': }
class { 'networking': }
class { 'vagrant': }

if $hostname == 'puppet' {
  class { 'puppet::server': }
}
