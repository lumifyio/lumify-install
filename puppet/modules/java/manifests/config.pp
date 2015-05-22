class java::config inherits java {
  file { '/etc/profile.d/java.sh':
    ensure => file,
    content => template('java/java.sh.erb')
  }
}
