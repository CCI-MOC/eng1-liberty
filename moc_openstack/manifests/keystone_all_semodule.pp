# This manifest creates an semodule for the keystone-all process
# Used to permit access to fernet keys
class moc_openstack::keystone_all_semodule {
  # Copy the bash script to /usr/local/bin
  file { 'keystone_all_semodule':
    ensure => 'file',
    source => 'puppet:///modules/moc_openstack/keystone_all_semodule.sh',
    path => '/usr/local/bin/keystone_all_semodule.sh',
    owner => 'root',
    group => 'root',
    mode  => '0744',
    notify => Exec['run_keystone_all_semodule'],
  }
  # Run the script, unless the module is installed
  exec { 'run_keystone_all_semodule':
    command => '/usr/local/bin/keystone_all_semodule.sh',
    unless  => '/sbin/semodule -l | /bin/grep keystone-all',
  }
}
