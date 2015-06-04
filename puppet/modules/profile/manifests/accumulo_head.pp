class profile::accumulo_head {
  class { '::java': }
  #class { '::cloudera::cdh5::hadoop': }
  class { '::accumulo::master': }
  class { '::accumulo::gc': }
  class { '::accumulo::monitor': }
  class { '::accumulo::tracer': }
}
