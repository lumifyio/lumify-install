class jetty::config inherits jetty {

  file { '/opt/jetty/etc/jetty.xml' :
    ensure  => file,
    content => template('jetty/jetty.xml.erb'),
    require => File['/opt/jetty'],
  }

  file { '/opt/jetty/etc/jetty-http.xml' :
    ensure  => file,
    content => template('jetty/jetty-http.xml.erb'),
    require => File['/opt/jetty'],
  }

  file { '/opt/jetty/etc/jetty-https.xml' :
    ensure  => file,
    content => template('jetty/jetty-https.xml.erb'),
    require => File['/opt/jetty'],
  }

  file { '/opt/jetty/etc/jetty-ssl.xml' :
    ensure  => file,
    content => template('jetty/jetty-ssl.xml.erb'),
    require => File['/opt/jetty'],
  }

  file { '/etc/default/jetty' :
    ensure  => file,
    content => 'JETTY_HOME=/opt/jetty; JETTY_USER=jetty',
  }

}