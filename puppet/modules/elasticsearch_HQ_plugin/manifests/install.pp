class elasticsearch_hq_plugin::install inherits elasticsearch_hq_plugin {
  include '::macro'

  macro::download { 'elasticsearch-hq-plugin-download' :
    url     => "https://github.com/royrusso/elasticsearch-HQ/zipball/master",
    path    => "${tmp_dir}/HQ-plugin.zip",
  } -> exec { "elasticsearch-hq-plugin-install" :
    command => "${elasticsearch_install_dir}/bin/plugin --url file://${tmp_dir}/HQ-plugin.zip --install HQ",
    cwd     => "${elasticsearch_install_dir}",
    creates => "${elasticsearch_plugin_dir}/HQ",
    require => Class['::elasticsearch'],
  }
}