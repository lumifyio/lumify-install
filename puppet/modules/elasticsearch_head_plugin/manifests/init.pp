class elasticsearch_head_plugin (
  $elasticsearch_install_dir  = elasticsearch_head_plugin::params::elasticsearch_install_dir,
  $elasticsearch_plugin_dir   = elasticsearch_head_plugin::params::elasticsearch_plugin_dir,
  $tmp_dir                    = elasticsearch_head_plugin::params::tmp_dir,
) inherits elasticsearch_head_plugin::params {
  class { '::elasticsearch_head_plugin::install': }
}