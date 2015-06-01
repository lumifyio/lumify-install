class profile::elasticsearch {
  class { '::java': }
  class { '::elasticsearch': }
  class { '::elasticsearch_securegraph_plugin': }
  class { '::elasticsearch_head_plugin': }
  class { '::elasticsearch_hq_plugin': }
}
