class cloudera::cdh5::hadoop::base inherits cloudera::cdh5::hadoop::hadoop {
  include '::java'
  include '::cloudera::cdh5::repo'
  include '::macro'

  case $architecture {
    'x86_64': { $pkg = 'hadoop.x86_64' }
    'i386':   { $pkg = 'hadoop.i686' }
    default:  { fail "unsupported architecture: ${architecture}" }
  }


#  notify{"Cloudera Base Install under way param namenode_ipaddress: ${namenode_ipaddress}": }
  package { $pkg :
    ensure  => installed,
    require => Class['java', 'cloudera::cdh5::repo'],
  }

  file { "/etc/hadoop/conf/core-site.xml":
    ensure  => file,
    content => template("cloudera/core-site.xml.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => [ Package["${pkg}"], File['/data0/hadoop'] ],
  }

file { "/etc/hadoop/conf/hdfs-site.xml":
    ensure  => file,
    content => template("cloudera/hdfs-site.xml.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => [ Package["${pkg}"], File['/data0/hdfs'] ],
  }

  file { "/etc/hadoop/conf/mapred-site.xml":
    ensure  => file,
    content => template("cloudera/mapred-site.xml.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => [ Package["${pkg}"], File['/data0/yarn'] ],
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
   # ensure_resource('file', "${name}", {ensure => directory})

    file {  $name  :
      ensure  => directory,
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rwx,o=',
      require =>  [ Package[$pkg] ],
    }

    file { [ "${name}/hadoop", "${name}/hadoop/tmp" ] :
      ensure  => directory,
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rwx,o=',
      require =>  [ File["${name}"], Package[$pkg] ],
    }

    file { [ "${name}/hdfs", "${name}/hdfs/name", "${name}/hdfs/data" ] :
      ensure  => directory,
      owner   => 'hdfs',
      group   => 'hadoop',
      mode    => 'u=rwx,g=rx,o=',
      require =>  [ File["${name}"], Package[$pkg] ],
    }

    file { [ "${name}/yarn", "${name}/yarn/local", "${name}/yarn/logs" ] :
      ensure  => directory,
      owner   => 'yarn',
      group   => 'yarn',
      mode    => 'u=rwx,g=rx,o=rx',
      require =>  [ File["${name}"], Package[$pkg] ],
    }
  }

  $data_dir_list = split($data_directories, ',')
  #notice{"Cloudera Base Install under way param data_dir_list ${$data_dir_list}": }
  ::cloudera::cdh5::hadoop::base::setup_data_directory { $data_dir_list :
    pkg => $pkg,
  }
}
