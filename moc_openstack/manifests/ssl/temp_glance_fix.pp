class moc_openstack::ssl::temp_glance_fix (
  $file   = "/usr/lib/python2.7/site-packages/glanceclient/common/https.py",
  $source = "puppet:///modules/moc_openstack/https.py",
) {

  file { $file:
    ensure => present,
    checksum => 'md5',
    mode => '0644',
    owner => 'root',
    group => 'root',
    source => $source,
  }
}
