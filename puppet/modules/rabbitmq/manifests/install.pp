class rabbitmq::install inherits rabbitmq {
  include '::macro'

  $rpm_url = "http://www.rabbitmq.com/releases/rabbitmq-server/v${rabbitmq_version}/rabbitmq-server-${rabbitmq_version}-1.noarch.rpm"
  $local_rpm = "/tmp/rabbitmq-server-${rabbitmq_version}-1.noarch.rpm"

  macro::download { 'rabbitmq-download':
    url  => $rpm_url,
    path => $local_rpm,
  }

  package { 'rabbitmq-server':
    ensure => installed,
    source => $local_rpm,
    provider => 'rpm',
    require => Macro::Download['rabbitmq-download'],
  }

  macro::ensure_dir{ "${rabbitmq_log_dir}" :
    owner   => $rabbitmq_user,
    group   => $rabbitmq_group,
    mode    => 'u=rwx,go=rx',
    require =>  [ Package['rabbitmq-server'] ],
  }

  macro::ensure_dir{ "${rabbitmq_mnesia_dir}" :
    owner   => $rabbitmq_user,
    group   => $rabbitmq_group,
    mode    => 'u=rwx,go=rx',
    require =>  [ Package['rabbitmq-server'] ],
  }
}