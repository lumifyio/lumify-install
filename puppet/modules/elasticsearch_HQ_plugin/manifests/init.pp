class elasticsearch_HQ_plugin (
  $elasticsearch_install_dir                = elasticsearch_HQ_plugin::params::elasticsearch_install_dir,
  $elasticsearch_plugin_dir                 = elasticsearch_HQ_plugin::params::elasticsearch_plugin_dir,
  $tmp_dir                                  = elasticsearch_HQ_plugin::params::tmp_dir,
) inherits elasticsearch_HQ_plugin::params {
  class { '::elasticsearch_HQ_plugin::install': }
}