class opencv::install inherits opencv {
  include '::repo::lumify'

  package { $opencv_package:
    ensure => installed
  }
}
