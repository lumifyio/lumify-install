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

  file { '/etc/default/rabbitmq-server' :
    ensure  => file,
    content => template('rabbitmq/rabbitmq-server.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => 'u=rw,go=r',
    require => Class['::rabbitmq::install'],
  }

#  file { '/etc/rabbitmq/rabbitmq-env.conf' :
#    ensure  => file,
#    content => template('rabbitmq/rabbitmq-env.conf.erb'),
#    owner   => 'root',
#    group   => $rabbitmq_group,
#    mode    => 'u=r,g=r,o=',
#    require => Class['::rabbitmq::install'],
#  }

  file { '/etc/rabbitmq/rabbitmq-ha-policy.json' :
    ensure  => file,
    content => template('rabbitmq/rabbitmq-ha-policy.json.erb'),
    owner   => 'root',
    group   => $rabbitmq_group,
    mode    => 'u=r,g=r,o=',
    require => Class['::rabbitmq::install'],
  }
}