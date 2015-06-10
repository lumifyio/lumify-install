class elasticsearch::service inherits elasticsearch {

  include '::java'

  service { 'elasticsearch':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['::java', '::elasticsearch::install', '::elasticsearch::config'],
  }
}