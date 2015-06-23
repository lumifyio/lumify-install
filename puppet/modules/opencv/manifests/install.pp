class opencv::install inherits opencv {
  include '::repo::lumify'

  package { 'lumify-opencv':
    ensure => installed
  }

  file { '/usr/lib/libopencv_java249.so':
    ensure => link,
    target => '/usr/local/share/OpenCV/java/libopencv_java249.so',
  }
}
