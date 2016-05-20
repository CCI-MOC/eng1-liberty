# Disable LRO on interfaces `em*`, which interacts badly with ovs. This only
# needs to be applied to the controller.
#
# See also:
#
# https://access.redhat.com/support/cases/#/case/01326984
class workarounds::disable_lro {
  if $::osfamily == 'RedHat' {
    file { '/sbin/ifup-local':
      ensure => present,
      owner => root,
      group => root,
      mode => 755,
      source => "puppet:///modules/workarounds/ifup-local",
    }
  } else {
    fail("The disable_lro workaround is only supported on RedHat systems!")
  }
}
