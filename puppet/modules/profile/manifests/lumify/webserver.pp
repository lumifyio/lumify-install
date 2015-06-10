class profile::lumify::webserver {
  class { '::jetty': }
  class { '::lumify::webserver': }
}