# Apply ssl related changes to controller node
class moc_openstack::ssl::additional_params (
  $controller_pub_host   = $quickstack::params::controller_pub_host,
  $keystone_auth_uri     = $quickstack::params::keystone_pub_url,
  $keystone_identity_uri = $quickstack::params::keystone_admin_url,
  $glance_pub_url        = $quickstack::params::glance_pub_url,
  $nova_pub_url          = $quickstack::params::nova_pub_url,
  $cinder_pub_url        = $quickstack::params::cinder_pub_url,
  $neutron_pub_url       = $quickstack::params::neutron_pub_url,
  $ssl_endpoints         = $quickstack::params::ssl_endpoints,
  $ssl_ca_file           = '/etc/pki/ca-trust/source/anchors/rootCA.crt',
  $ssl_keystone_key      = '/etc/pki/tls/private/keystone.key',
  $ssl_keystone_cert     = '/etc/pki/tls/certs/keystone.crt',
  $ssl_nova_key          = '/etc/pki/tls/private/nova.key',
  $ssl_nova_cert         = '/etc/pki/tls/certs/nova.crt',
  $ssl_glance_key        = '/etc/pki/tls/private/glance.key',
  $ssl_glance_cert       = '/etc/pki/tls/certs/glance.crt',
  $ssl_neutron_key       = '/etc/pki/tls/private/neutron.key',
  $ssl_neutron_cert      = '/etc/pki/tls/certs/neutron.crt',
) inherits quickstack::controller_common {

  if str2bool_i("$ssl_endpoints") {

    nova_config {
      #'cinder/endpoint_template':   value => "${auth_protocol}://${controller_pub_host}:8776/v1/%(project_id)s"; 
      #'cinder/ca_certificates_file': value => $ssl_ca_file;
      #'glance/protocol':                  value => 'https';
      #'keystone_authtoken/cafile':        value => $ssl_ca_file;
      #'ssl/enable':                       value => true;
      #'ssl/ca_file':                      value => $ssl_ca_file;
      #'ssl/cert_file':                    value => $ssl_nova_cert;
      #'ssl/key_file':                     value => $ssl_nova_key;
    }

    glance_api_config {
      #'glance_store/cinder_endpoint_template':   value => "${auth_protocol}://${controller_pub_host}:8776/v1/%(project_id)s"; 
      #'glance_store/cinder_ca_certificates_file': value => $ssl_ca_file;
      #'keystone_authtoken/cafile': value => $ssl_ca_file;
    }

    glance_registry_config {
      #'keystone_authtoken/cafile': value => $ssl_ca_file;
    }

    neutron_api_config {
      #'filter:authtoken/cafile': value => $ssl_ca_file;
    }

    neutron_config {
      #'keystone_authtoken/cafile': value => $ssl_ca_file;
    }

    cinder_config {
      #'DEFAULT/nova_endpoint_template': value => $nova_pub_url;
      #'keystone_authtoken/auth_protocol': value => 'https';
      #'keystone_authtoken/auth_uri': value => $keystone_auth_uri;
      #'keystone_authtoken/identity_uri': value => $keystone_identity_uri;
      #'keystone_authtoken/cafile': value => $ssl_ca_file;
    }

    cinder_api_paste_ini {
      #'filter:authtoken/cafile': value => $ssl_ca_file;
    }

  }
}
