class moc_openstack::ssl::add_nova_cert (
  $nova_crt      = "/etc/pki/tls/certs/nova.crt",
  $nova_key      = "/etc/pki/tls/private/nova.key",
  $nova_crt_path = "puppet:///modules/moc_openstack/certs/host.crt",
  $nova_key_path = "puppet:///modules/moc_openstack/certs/host.key",
) {

  file { $nova_crt:
    ensure => present,
    mode => '0644',
    owner => 'nova',
    group => 'nova',
    source => $nova_crt_path,
  }

  file { $nova_key:
    ensure => present,
    mode => '0644',
    owner => 'nova',
    group => 'nova',
    source => $nova_key_path,
  }
}
