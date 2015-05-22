class sphinx::install inherits sphinx {
  include '::repo::lumify'

  package { 'lumify-pocketsphinx':
    ensure => installed
  }
}
