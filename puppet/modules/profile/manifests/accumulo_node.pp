class profile::accumulo_node {
  #class { '::java': }
  #class { '::cloudera::cdh5::hadoop': }
  class { '::accumulo::tablet': }
}
