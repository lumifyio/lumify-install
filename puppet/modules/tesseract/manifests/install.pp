class tesseract::install inherits tesseract {
  include '::repo::lumify'

  package { 'lumify-tesseract-eng':
    ensure => installed
  }
}
