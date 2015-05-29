class elasticsearch::service inherits elasticsearch {

  service { 'elasticsearch':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['::java', '::elasticsearch::install', '::elasticsearch::config'],
  }
}