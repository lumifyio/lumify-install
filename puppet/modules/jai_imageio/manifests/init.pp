class jai_imageio (
  String $jai_imageio_version = $jai_imageio::params::jai_imageio_version
) inherits jai_imageio::params {
  include '::jai'

  class { 'jai_imageio::install': }
}
