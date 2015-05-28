class elasticsearch::config inherits elasticsearch {
  file { "${configdir}/elasticsearch.yml" :
    ensure  => file,
    content => template("elasticsearch/elasticsearch-${elasticsearch_version}.yml.erb"),
    require => Package["elasticsearch"],
  }

  file { "/etc/sysconfig/elasticsearch" :
    ensure  => file,
    content => template("elasticsearch/elasticsearch-${elasticsearch_version}.erb"),
    require => Package["elasticsearch"],
  }

  file { "${configdir}/logging.yml" :
    ensure  => file,
    content => template("elasticsearch/logging-${elasticsearch_version}.yml.erb"),
    require => Package["elasticsearch"],
  }
}