class opencv (
  String $opencv_version = $opencv::params::opencv_version
) inherits opencv::params {
  class { '::opencv::install': }
}
