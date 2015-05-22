class java::install inherits java {
  include '::macro'
  include '::lumify_global'

  case $rpm_source {
    'download': {
      $rpm_url = "${lumify_global::download_base_url}/java/${java_rpm}"
      $local_rpm = "${lumify_global::tmp_dir}/${java_rpm}"

      macro::download { 'jdk-download':
        url  => $rpm_url,
        path => $local_rpm,
      }

      package { "jdk":
        ensure => installed,
        source => $local_rpm,
        provider => 'rpm',
        require => Macro::Download['jdk-download'],
      }
    }
    'repo': {
      package { 'jdk':
        ensure => installed,
      }
    }
    default: {
      fail "Unsupported Java RPM source: ${rpm_source}. Must be one of [ download | repo ]"
    }
  }
}
