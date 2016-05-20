class moc_openstack::ssl::add_cinder_cert (
  $cinder_crt      = "/etc/pki/tls/certs/cinder.crt",
  $cinder_key      = "/etc/pki/tls/private/cinder.key",
  $cinder_crt_path = "puppet:///modules/moc_openstack/certs/host.crt",
  $cinder_key_path = "puppet:///modules/moc_openstack/certs/host.key",
) {

  file { $cinder_crt:
    ensure => present,
    mode => '0644',
    owner => 'cinder',
    group => 'cinder',
    source => $cinder_crt_path,
  }

  file { $cinder_key:
    ensure => present,
    mode => '0644',
    owner => 'cinder',
    group => 'cinder',
    source => $cinder_key_path,
  }
}
