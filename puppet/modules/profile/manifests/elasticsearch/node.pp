class profile::elasticsearch::node {
  class { '::elasticsearch': }
  class { '::elasticsearch_head_plugin': }
  class { '::elasticsearch_hq_plugin': }
  class { '::elasticsearch_securegraph_plugin': }
}