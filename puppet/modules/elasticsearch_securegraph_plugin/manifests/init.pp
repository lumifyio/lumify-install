class elasticsearch_securegraph_plugin (
  $elasticsearch_securegraph_plugin_version = $elasticsearch_securegraph_plugin::params::elasticsearch_securegraph_plugin_version,
  $elasticsearch_install_dir                = $elasticsearch_securegraph_plugin::params::elasticsearch_install_dir,
  $elasticsearch_plugin_dir                 = $elasticsearch_securegraph_plugin::params::elasticsearch_plugin_dir,
  $tmp_dir                                  = $elasticsearch_securegraph_plugin::params::tmp_dir,
) inherits elasticsearch_securegraph_plugin::params {
  class { '::elasticsearch_securegraph_plugin::install': }
}
