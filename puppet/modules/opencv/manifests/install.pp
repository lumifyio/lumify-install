class opencv::install inherits opencv {
  include '::repo::lumify'

  package { 'lumify-opencv':
    ensure => installed
  }
}
