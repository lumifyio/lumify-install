class profile::rabbitmq::node {
  class { '::epel': }
  class { '::erlang': }
  class { '::rabbitmq': }
}