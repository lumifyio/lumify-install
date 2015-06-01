class elasticsearch_hq_plugin (
  $elasticsearch_install_dir  = $elasticsearch_hq_plugin::params::elasticsearch_install_dir,
  $elasticsearch_plugin_dir   = $elasticsearch_hq_plugin::params::elasticsearch_plugin_dir,
  $tmp_dir                    = $elasticsearch_hq_plugin::params::tmp_dir,
) inherits elasticsearch_hq_plugin::params {
  class { '::elasticsearch_hq_plugin::install': }
  contain '::elasticsearch_hq_plugin::install'
}