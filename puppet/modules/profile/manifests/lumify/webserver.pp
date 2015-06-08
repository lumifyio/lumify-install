class profile::lumify::webserver {
  class { '::java': }
  class { '::jetty': }
  class { '::lumify::webserver': }
}