class elasticsearch::install inherits elasticsearch {
  package { 'elasticsearch' :
    ensure   => $rpm_version,
    requires => Class['::elasticsearch::repo'],
  }
}