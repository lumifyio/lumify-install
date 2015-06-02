class jetty(
  $version=$jetty::params::version,
  $jetty_insecure_listen_port = $jetty::params::jetty_insecure_listen_port,
  $jetty_confidential_listen_port = $jetty::params::jetty_confidential_listen_port,
  $jetty_confidential_redirect_port = $jetty::params::jetty_confidential_redirect_port ,
  $jetty_key_store_path = $jetty::params::jetty_key_store_path,
  $jetty_key_store_password = $jetty::params::jetty_key_store_password,
  $jetty_trust_store_path = $jetty::params::jetty_trust_store_path,
  $jetty_trust_store_password = $jetty::params::jetty_trust_store_password,
  $jetty_client_auth = $jetty::params::jetty_client_auth,
  $jetty_keypass=$jetty::params::jetty_keypass,
  $jetty_storepass=$jetty::params::jetty_storepass,
  $lumify_domain=$jetty::params::lumify_domain,
  $jetty_config_dir=$jetty::params::jetty_config_dir
)
inherits jetty::params {
class { '::jetty::install': } ->
class { '::jetty::config': } ->
class { '::jetty::service': }

  contain '::jetty::install'
  contain '::jetty::config'
  contain '::jetty::service'
}



