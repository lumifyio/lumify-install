class jetty::install inherits jetty {
  include '::macro'
  include '::lumify_global'
  include '::java'

  group { 'jetty' :
    ensure => present,
  }

  user { 'jetty' :
    ensure  => present,
    gid     => 'jetty',
    home    => '/opt/jetty',
    require => Group['jetty'],
  }

  macro::download { 'jetty-download':
    url  => "http://eclipse.org/downloads/download.php?file=/jetty/${version}/dist/jetty-distribution-${version}.tar.gz&r=1",
    path => "/tmp/jetty-distribution-${version}.tar.gz",
  } -> macro::extract { 'jetty-extract':
    file    => "/tmp/jetty-distribution-${version}.tar.gz",
    path    => "/opt",
    creates => "/opt/jetty-distribution-${version}",
  }

  file { "/opt/jetty-distribution-${version}" :
    ensure  => directory,
    owner   => 'jetty',
    group   => 'jetty',
    recurse => true,
    require => [ User['jetty'], Macro::Extract['jetty-extract'] ],
  }

  file { '/opt/jetty' :
    ensure  => link,
    target  => "/opt/jetty-distribution-${version}",
    require => File["/opt/jetty-distribution-${version}"],
  }

  file { '/etc/init.d/jetty' :
    ensure  => link,
    target  => '/opt/jetty/bin/jetty.sh',
    require => File['/opt/jetty'],
  }

  file { '/opt/jetty/start.ini' :
    ensure  => file,
    content => template('jetty/start.ini.erb'),
    require => File['/opt/jetty'],
  }

  file { '/opt/jetty/resources/jetty-logging.properties' :
    ensure  => file,
    source => 'puppet:///modules/jetty/jetty-logging.properties',
    require => File['/opt/jetty'],
  }

  file { "${jetty_config_dir}" :
    ensure  => directory,
    owner   => 'jetty',
    group   => 'jetty',
    recurse => true,
    require => [ User['jetty'] ],
  }

  file { "/etc/security/limits.d/jetty.conf":
    ensure  => file,
    content => template("jetty/jetty.conf.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => [ User['jetty'] ],
  }

  exec { 'create default java keystore' :
    command => "/usr/java/default/bin/keytool -genkeypair -keysize 2048 -keyalg RSA -keystore ${jetty_key_store_path} -keypass ${jetty_keypass} -storepass ${jetty_storepass} -dname CN=${lumify_domain}",
    creates => "${jetty_key_store_path}",
    require => [ File["${jetty_config_dir}"], Class['::java'] ],
    logoutput => true,
  }
}