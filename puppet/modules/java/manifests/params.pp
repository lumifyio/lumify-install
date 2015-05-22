class java::params {
  $java_version = '7u79'
  $java_home = '/usr/java/default'
  $rpm_source = 'download'

  case $architecture {
    'x86_64': {
      $package_arch = 'x64'
    }
    'i386': {
      $package_arch = 'i586'
    }
    default: {
      fail "unsupported architecture: ${architecture}"
    }
  }
  $java_rpm = "jdk-${java_version}-linux-${package_arch}.rpm"
}
