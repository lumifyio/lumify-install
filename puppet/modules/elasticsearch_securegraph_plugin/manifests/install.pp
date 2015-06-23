class elasticsearch_securegraph_plugin::install inherits elasticsearch_securegraph_plugin {
  include '::macro'

  macro::download { 'elasticsearch-securegraph-plugin-download' :
    url   => "https://oss.sonatype.org/service/local/repositories/releases/content/org/securegraph/securegraph-elasticsearch-plugin/${elasticsearch_securegraph_plugin_version}/securegraph-elasticsearch-plugin-${elasticsearch_securegraph_plugin_version}.zip",
    path  => "${tmp_dir}/securegraph-elasticsearch-plugin-${elasticsearch_securegraph_plugin_version}.zip",
  } -> exec { "elasticsearch-securegraph-plugin-install" :
    command => "${elasticsearch_install_dir}/bin/plugin --url file://${tmp_dir}/securegraph-elasticsearch-plugin-${elasticsearch_securegraph_plugin_version}.zip --install securegraph",
    cwd     => "${elasticsearch_install_dir}",
    creates => "${elasticsearch_plugin_dir}/securegraph",
    require => Class['::elasticsearch'],
  } -> exec { "restart-elasticsearch-service":
    command => "/sbin/service elasticsearch restart"
  }
}