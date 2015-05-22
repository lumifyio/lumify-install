class jai (
  String $jai_version = $jai::params::jai_version
) inherits jai::params {
  include '::java'

  class { '::jai::install': }
}
