class elasticsearch::service inherits elasticsearch {
  if $service_manage == true {
    service { 'elasticsearch':
      ensure     => "running",
      enable     => "true",
      name       => "elasticsearch",
      hasstatus  => true,
      hasrestart => true,
    }
  }
}