class jetty::service inherits jetty {
  service { 'jetty' :
    enable  => true,
    ensure  => running,
    require => [ File['/etc/init.d/jetty'],
      File['/etc/default/jetty'],
      File['/opt/jetty/etc/jetty.xml'],
      File['/opt/jetty/etc/jetty-http.xml'],
      File['/opt/jetty/etc/jetty-https.xml'],
      File['/opt/jetty/etc/jetty-ssl.xml']
    ],
  }
}