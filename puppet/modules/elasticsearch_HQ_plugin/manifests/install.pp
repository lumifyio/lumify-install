class elasticsearch_HQ_plugin::install inherits elasticsearch_HQ_plugin {
  include '::macro'

  macro::download { 'elasticsearch-HQ-download' :
    url     => "https://github.com/royrusso/elasticsearch-HQ/zipball/master",
    path    => "${tmp_dir}/HQ-plugin.zip",
  } -> exec { "elasticsearch-HQ-install" :
    command => "${elasticsearch_install_dir}/bin/plugin --url file://${tmp_dir}/HQ-plugin.zip --install HQ",
    cwd     => "${elasticsearch_install_dir}",
    creates => "${elasticsearch_plugin_dir}/HQ",
    require => Package['elasticsearch'],
  }
}