class jetty::params {
  $version='9.2.7.v20150116'
  $jetty_insecure_listen_port      = '8080'
  $jetty_confidential_listen_port = '8443'
  $jetty_confidential_redirect_port = '8443'
  $jetty_config_dir = '/opt/jetty/config'
  $jetty_key_store_path = "$jetty_config_dir/jetty.jks"
  $jetty_key_store_password = 'OBF:1v2j1uum1xtv1zej1zer1xtn1uvk1v1v'
  $jetty_trust_store_path = "$jetty_config_dir/jetty.jks"
  $jetty_trust_store_password = 'OBF:1v2j1uum1xtv1zej1zer1xtn1uvk1v1v'
  $jetty_client_auth = 'false'
  $jetty_keypass='password'
  $jetty_storepass='password'
  $jetty_min_heap_size='1024m'
  $jetty_max_heap_size='1024m'
  $jetty_max_permgen_size='512m'
  $jetty_max_open_file_descriptors='32768'
  $lumify_domain='demo.lumify.io'
  $jetty_logs_dir='/data0/jetty/log'
  $jetty_base_dir='/data0/jetty'
  case $architecture {
    'x86_64': {
      $package_arch = 'x64'
    }
    'i386': {
      $package_arch = 'i586'
    }
    default: {
      fail "unsupported architecture: ${architecture}"
    }
  }
}

