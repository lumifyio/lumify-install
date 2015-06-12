class cloudera::cdh5::hadoop::base inherits cloudera::cdh5::hadoop::hadoop {
  include '::java'
  include '::cloudera::cdh5::repo'
  include '::macro'

  case $architecture {
    'x86_64': { $pkg = 'hadoop.x86_64' }
    'i386':   { $pkg = 'hadoop.i686' }
    default:  { fail "unsupported architecture: ${architecture}" }
  }

  package { $pkg :
    ensure  => installed,
    require => Class['java', 'cloudera::cdh5::repo'],
  }

  macro::ensure_dir{ "/etc/hadoop/conf" :
    owner   => 'root',
    group   => 'root',
    mode    => 'u=rwx,go=rx',
    require =>  [ Package[$pkg] ],
  }

  file { "/etc/hadoop/conf/core-site.xml":
    ensure  => file,
    content => template("cloudera/core-site.xml.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => [ Package["${pkg}"], ],
  }

  file { "/etc/hadoop/conf/hdfs-site.xml":
    ensure  => file,
    content => template("cloudera/hdfs-site.xml.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => [ Package["${pkg}"], ],
  }

  file { "/etc/hadoop/conf/mapred-site.xml":
    ensure  => file,
    content => template("cloudera/mapred-site.xml.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => [ Package["${pkg}"] ],
  }

  file { "/etc/hadoop/conf/log4j.properties":
    ensure  => file,
    source  => "puppet:///modules/cloudera/log4j.properties",
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => Package["${pkg}"],
  }

  file { "/etc/hadoop/conf/masters":
    ensure  => file,
    content => template("cloudera/masters.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => Package["${pkg}"],
  }

  file { "/etc/hadoop/conf/slaves":
    ensure  => file,
    content => template("cloudera/slaves.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => Package["${pkg}"],
  }

  file { "/usr/lib/hadoop/.ssh" :
    ensure  => directory,
    owner   => 'hdfs',
    group   => 'hadoop',
    mode    => 'u=rwx,go=',
    require => Package[$pkg],
  }

  macro::setup_passwordless_ssh { 'hdfs' :
    sshdir  => '/usr/lib/hadoop/.ssh',
    require => File['/usr/lib/hadoop/.ssh'],
  }

  define setup_data_directory ($pkg) {
    macro::ensure_dir{ "${$name}" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rwx,o=',
      require =>  [ Package[$pkg] ],
    }

    macro::ensure_dir{ "${name}/tmp" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rwx,o=',
      require =>  [ Package[$pkg] ],
    }

    macro::ensure_dir{ "${name}/hdfs" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rx,o=',
      require =>  [ Package[$pkg] ],
    }

    macro::ensure_dir{ "${name}/hdfs/name" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rx,o=',
      require =>  [ Package[$pkg] ],
    }

    macro::ensure_dir{ "${name}/hdfs/data" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rx,o=',
      require =>  [ Package[$pkg] ],
    }

    macro::ensure_dir{ "${name}/yarn" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rx,o=rx',
      require =>  [ Package[$pkg] ],
    }

    macro::ensure_dir{ "${name}/yarn/local" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rx,o=rx',
      require =>  [ Package[$pkg] ],
    }

    macro::ensure_dir{ "${name}/yarn/logs" :
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rx,o=rx',
      require =>  [ Package[$pkg] ],
    }
  }

  ::cloudera::cdh5::hadoop::base::setup_data_directory { $data_directories :
    pkg => $pkg,
  }
}
