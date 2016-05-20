# installs ceph from file in modules/workarounds/files 

define workarounds::install_package($source, $file_name, $package_name) {
  if $::osfamily == 'RedHat' {
    file { "$file_name":
      ensure => present,
      owner => root,
      group => root,
      mode => 755,
      source => $source,
    } ->
    package { "$package_name":
      ensure => latest,
      provider => 'rpm',
      source => "$file_name",
    }
  } else {
    fail("The install_missing_package workaround is only supported on RedHat systems!")
  }
}
