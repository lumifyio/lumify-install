class cloudera::cdh5::hadoop::namenode {
  include cloudera::cdh5::hadoop::base
  
  package { 'hadoop-hdfs-namenode':
    ensure  => installed,
    require => Class['::cloudera::cdh5::hadoop::base'],
  }

  exec { 'format-namenode' :
    path => "/sbin",
    command => 'service hadoop-hdfs-namenode init --force',
    require => Package['hadoop-hdfs-namenode'],
  }

  service { 'hadoop-hdfs-namenode' :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [ Package['hadoop-hdfs-namenode'], Exec['format-namenode'], ],
  }

  exec { 'hdfs-history-dir' :
    command => "/usr/bin/sudo -u hdfs /usr/bin/hadoop fs -mkdir -p /user/history && /usr/bin/sudo -u hdfs /usr/bin/hadoop fs -chmod -R 1777 /user/history && /usr/bin/sudo -u hdfs /usr/bin/hadoop fs -chown mapred:hadoop /user/history",
    require => Service['hadoop-hdfs-namenode'],
  }

  exec { 'hdfs-yarn-dir' :
    command => "/usr/bin/sudo -u hdfs /usr/bin/hadoop fs -mkdir -p /var/log/hadoop-yarn && /usr/bin/sudo -u hdfs /usr/bin/hadoop fs -chown yarn:mapred /var/log/hadoop-yarn",
    require => Service['hadoop-hdfs-namenode'],
  }
}
