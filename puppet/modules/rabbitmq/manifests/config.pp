class rabbitmq::config inherits rabbitmq {

  if $erlang_cookie != '' {
    file { '/var/lib/rabbitmq/.erlang.cookie' :
      ensure  => file,
      content => $erlang_cookie,
      owner   => $rabbitmq_user,
      group   => $rabbitmq_group,
      mode    => 'u=r,go=',
      require => Class['::rabbitmq::install'],
    }
  }

  file { '/etc/rabbitmq/rabbitmq.config' :
    ensure  => file,
    content => template('rabbitmq/rabbitmq.config.erb'),
    owner   => 'root',
    group   => $rabbitmq_group,
    mode    => 'u=r,g=r,o=',
    require => Class['::rabbitmq::install'],
  }

  file { '/etc/rabbitmq/rabbitmq-env.config' :
    ensure  => file,
    content => template('rabbitmq/rabbitmq-env.conf.erb'),
    owner   => 'root',
    group   => $rabbitmq_group,
    mode    => 'u=r,g=r,o=',
    require => Class['::rabbitmq::install'],
  }

  file { '/etc/rabbitmq/rabbitmq-ha-policy.json' :
    ensure  => file,
    content => template('rabbitmq/rabbitmq-ha-policy.json.erb'),
    owner   => 'root',
    group   => $rabbitmq_group,
    mode    => 'u=r,g=r,o=',
    require => Class['::rabbitmq::install'],
  }
}