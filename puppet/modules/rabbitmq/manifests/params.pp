class rabbitmq::params {
  $rabbitmq_version         = '3.4.2'
  $rabbitmq_mgmt_user       = 'guest'
  $rabbitmq_mgmt_user_pw    = 'guest'
  $rabbitmq_user            = 'rabbitmq'
  $rabbitmq_group           = 'rabbitmq'
  $cluster_nodes            = []
  $rabbitmq_config_dir      = '/etc/rabbitmq'
  $rabbitmq_log_dir         = '/var/log/rabbitmq'
  $rabbitmq_mnesia_dir      = '/var/lib/rabbitmq/mnesia'
  $erlang_cookie            = '' # http://www.rabbitmq.com/clustering.html#setup
}
