class elasticsearch::install inherits elasticsearch {

  include '::macro'
  include '::elasticsearch::repo'

  package { 'elasticsearch' :
    ensure   => $rpm_version,
    require  => Class['::elasticsearch::repo'],
  }

  macro::ensure_dir{ "${log_dir}" :
    owner   => $user,
    group   => $group,
    mode    => 'u=rwx,go=rx',
    require => Package['elasticsearch'],
  }

  macro::ensure_dir{ "${work_dir}" :
    owner   => $user,
    group   => $group,
    mode    => 'u=rwx,go=r',
    require => Package['elasticsearch'],
  }

  macro::ensure_dir{ "${tmp_dir}" :
    owner   => $user,
    group   => $group,
    mode    => 'u=rwx,go=r',
    require => Package['elasticsearch'],
  }

  $data_dirs.each |$dir| {
    macro::ensure_dir{ "${dir}" :
      owner   => $elasticsearch::user,
      group   => $elasticsearch::group,
      mode    => 'u=rwx,go=rx',
      require => Package['elasticsearch'],
    }
  }

  file { "/etc/security/limits.d/elasticsearch.conf":
    ensure  => file,
    content => template("elasticsearch/elasticsearch.conf.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => Package['elasticsearch'],
  }
}