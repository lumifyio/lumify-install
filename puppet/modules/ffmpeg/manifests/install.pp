class ffmpeg::install inherits ffmpeg {
  include '::repo::lumify'

  package { 'lumify-ffmpeg':
    ensure  => installed,
  }
}
