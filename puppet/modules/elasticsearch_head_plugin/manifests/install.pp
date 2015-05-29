class elasticsearch_head_plugin::install inherits elasticsearch_head_plugin {
  include '::macro'

  macro::download { 'elasticsearch-head-plugin-download' :
    url     => "https://github.com/mobz/elasticsearch-head/archive/master.zip",
    path    => "${tmp_dir}/head-plugin.zip",
  } -> exec { 'elasticsearch-head-plugin-install' :
    command => "${elasticsearch_install_dir}/bin/plugin --url file://${tmp_dir}/head-plugin.zip --install head",
    cwd     => "${elasticsearch_install_dir}",
    creates => "${elasticsearch_plugin_dir}/head",
    require => Class['::elasticsearch'],
  }
}