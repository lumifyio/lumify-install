class profile::lumify::webserver {
  class { '::lumify::web::config': }
  class { '::lumify::web::deploy': }
}