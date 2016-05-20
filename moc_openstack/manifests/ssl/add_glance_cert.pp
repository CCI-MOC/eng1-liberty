class moc_openstack::ssl::add_glance_cert (
  $glance_crt      = "/etc/pki/tls/certs/glance.crt",
  $glance_key      = "/etc/pki/tls/private/glance.key",
  $glance_crt_path = "puppet:///modules/moc_openstack/certs/host.crt",
  $glance_key_path = "puppet:///modules/moc_openstack/certs/host.key",
) {

  file { $glance_crt:
    ensure => present,
    mode => '0644',
    owner => 'glance',
    group => 'glance',
    source => $glance_crt_path,
  }

  file {$glance_key:
    ensure => present,
    mode => '0644',
    owner => 'glance',
    group => 'glance',
    source => $glance_key_path,
  }
}
