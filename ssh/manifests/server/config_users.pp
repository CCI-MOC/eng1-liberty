# This file implements logic to add and configure users.
#
# $users: is an array consisting of users with their username,
#         password and hashed_password value.
#
# Input is in the form:
# [
#   {"username": "user1",
#    "password": "pass1",
#    "hashed_password": <hashed_password_value>,
#   },
#   {"username": "user2",
#    "password": "pass2",
#    "hashed_password": <hashed_password_value>,
#   },
#   ...
# ]
#
# To generate hashed_password, one can use below mentioned
# python command:
# python3 -c 'import crypt; print(crypt.crypt("password", crypt.mksalt()))'
#
class ssh::server::config_users (
  $users = $quickstack::params::moc_users
) {

  define config_user ($config = $name) {
    $user            = $config['username']
    $password        = $config['password']
    $hashed_password = $config['hashed_password']

    case $::osfamily {
      redhat: {
        user { $user:
          ensure     => 'present',
          home       => "/home/${user}",
          groups     => 'wheel',
          password   => $hashed_password,
          managehome => true,
        } ->
        file { "/home/${user}/.ssh":
          ensure => directory,
          owner => $user,
          group => $user,
          mode => '0700',
        } ->
        file { "/home/${user}/.ssh/authorized_keys":
          ensure  => present,
          owner   => $user,
          group   => $user,
          mode    => '0600',
          replace => true,
          source  => "puppet:///modules/${module_name}/keys/${user}.pub",
          require => Class['ssh::server::install']
        } ->
        file {"/home/${user}/access.txt":
          ensure  => present,
	  owner   => $user,
	  group   => $user,
	  mode    => '0400',
	  replace => true,
	  content => $password,
        }
      }
      default: {
          fail("Unsupported platform: ${::osfamily}/${::operatingsystem}")
      }
    }
  }

  # traverse over users array and configure each user
  config_user { $users: }
}
