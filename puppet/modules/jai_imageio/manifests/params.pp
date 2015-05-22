class jai_imageio::params {
  $jai_imageio_version = '1.1'
  $jai_imageio_file_version = regsubst($jai_imageio_version, '[^0-9a-zA-Z]','_','G')
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
  $jai_imageio_install_file = "jai_imageio-${jai_imageio_file_version}-lib-linux-${file_arch}-jdk.bin"
}
