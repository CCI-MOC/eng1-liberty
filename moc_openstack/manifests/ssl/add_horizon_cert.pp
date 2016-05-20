class moc_openstack::ssl::add_horizon_cert (
  $horizon_crt      = '/etc/pki/tls/certs/horizon.crt',
  $horizon_key      = '/etc/pki/tls/private/horizon.key',
  $horizon_crt_path = 'puppet:///modules/moc_openstack/certs/host.crt',
  $horizon_key_path = 'puppet:///modules/moc_openstack/certs/host.key',
) {

  file {$horizon_crt:
    ensure => present,
    mode => '0644',
    owner => 'root',
    group => 'root',
    source => $horizon_crt_path,
  }

  file {$horizon_key:
    ensure => present,
    mode => '0644',
    owner => 'root',
    group => 'root',
    source => $horizon_key_path,
  }
}
