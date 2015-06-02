class profile::jetty {
  class { '::java': }
  class { '::jetty': }
}
