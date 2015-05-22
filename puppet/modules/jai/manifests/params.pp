class jai::params {
  $jai_version = '1.1.3'
  $jai_file_version = regsubst($jai_version, '[^0-9a-zA-Z]','_','G')
  case $architecture {
    'x86_64': {
      $file_arch = 'amd64'
    }
    'i386': {
      $file_arch = 'i586'
    }
    default: {
      fail "unsupported architecture: ${architecture}"
    }
  }
  $jai_install_file = "jai-${jai_file_version}-lib-linux-${file_arch}-jdk.bin"
}
