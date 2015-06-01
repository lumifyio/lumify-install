class profile::rabbitmq {
  class { '::epel': }
  class { '::erlang': }
  class { '::rabbitmq': }
}
