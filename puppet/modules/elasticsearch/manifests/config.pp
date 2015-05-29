class elasticsearch::config inherits elasticsearch {

  file { "${config_dir}/elasticsearch.yml" :
    ensure  => file,
    content => template("elasticsearch/elasticsearch-${elasticsearch_version}.yml.erb"),
    require  => Class['::elasticsearch::install'],
  }

  file { '/etc/sysconfig/elasticsearch' :
    ensure  => file,
    content => template("elasticsearch/elasticsearch-${elasticsearch_version}.erb"),
    require  => Class['::elasticsearch::install'],
  }

  file { "${config_dir}/logging.yml" :
    ensure  => file,
    content => template("elasticsearch/logging-${elasticsearch_version}.yml.erb"),
    require  => Class['::elasticsearch::install'],
  }
}