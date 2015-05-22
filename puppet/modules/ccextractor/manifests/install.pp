class ccextractor::install inherits ccextractor {
  include '::repo::lumify'

  package { 'lumify-ccextractor':
    ensure => installed
  }
}
