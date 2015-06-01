class rabbitmq::params {
  $rabbitmq_version         = '3.4.2'
  $rabbitmq_mgmt_user       = 'guest'
  $rabbitmq_mgmt_user_pw    = 'guest'
  $rabbitmq_user            = 'rabbitmq'
  $rabbitmq_group           = 'rabbitmq'
  $cluster_nodes            = []
  $erlang_cookie            = '' # http://www.rabbitmq.com/clustering.html#setup
}
