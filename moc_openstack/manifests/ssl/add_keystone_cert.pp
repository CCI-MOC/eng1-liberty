class moc_openstack::ssl::add_keystone_cert (
  $keystone_crt      = "/etc/pki/tls/certs/keystone.crt",
  $keystone_key      = "/etc/pki/tls/private/keystone.key",
  $keystone_crt_path = "puppet:///modules/moc_openstack/certs/host.crt",
  $keystone_key_path = "puppet:///modules/moc_openstack/certs/host.key",
) {

  file { $keystone_crt:
    ensure => present,
    mode => '0644',
    owner => 'keystone',
    group => 'keystone',
    source => $keystone_crt_path,
  }

  file { $keystone_key:
    ensure => present,
    mode => '0644',
    owner => 'keystone',
    group => 'keystone',
    source => $keystone_key_path,
  }
}
