class rabbitmq (
  $rabbitmq_version       = $rabbitmq::params::rabbitmq_version,
  $rabbitmq_mgmt_user     = $rabbitmq::params::rabbitmq_mgmt_user,
  $rabbitmq_mgmt_user_pw  = $rabbitmq::params::rabbitmq_mgmt_user_pw,
  $rabbitmq_user          = $rabbitmq::params::rabbitmq_user,
  $rabbitmq_group         = $rabbitmq::params::rabbitmq_group,
  $cluster_nodes          = $rabbitmq::params::cluster_nodes,
  $erlang_cookie          = $rabbitmq::params::erlang_cookie,
  $rabbitmq_log_dir       = $rabbitmq::params::rabbitmq_log_dir,
  $rabbitmq_mnesia_dir    = $rabbitmq::params::rabbitmq_mnesia_dir,
) inherits rabbitmq::params {
  class { '::rabbitmq::install': } ->
  class { '::rabbitmq::config': } ->
  class { '::rabbitmq::service': }
  contain '::rabbitmq::install'
  contain '::rabbitmq::config'
  contain '::rabbitmq::service'
}