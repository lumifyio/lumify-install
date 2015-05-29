class elasticsearch::install inherits elasticsearch {

  include '::elasticsearch::repo'

  package { 'elasticsearch' :
    ensure   => $rpm_version,
    require  => Class['::elasticsearch::repo'],
  }
}