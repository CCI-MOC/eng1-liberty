class moc_openstack::ssl::add_neutron_cert (
  $neutron_crt      = "/etc/pki/tls/certs/neutron.crt",
  $neutron_key      = "/etc/pki/tls/private/neutron.key",
  $neutron_crt_path = "puppet:///modules/moc_openstack/certs/host.crt",
  $neutron_key_path = "puppet:///modules/moc_openstack/certs/host.key",
) {

  file { $neutron_crt:
    ensure => present,
    mode => '0644',
    owner => 'neutron',
    group => 'neutron',
    source => $neutron_crt_path,
  }

  file { $neutron_key:
    ensure => present,
    mode => '0644',
    owner => 'neutron',
    group => 'neutron',
    source => $neutron_key_path,
  }
}
