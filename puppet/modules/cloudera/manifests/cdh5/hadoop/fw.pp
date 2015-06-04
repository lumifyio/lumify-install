class cloudera::cdh5::hadoop::fw::namenode (
  $srcnet = "0.0.0.0/0"
){
  firewall { '081 allow hadoop namenode' :
    port   => [1-65535], # was 8020, 40400, 50070
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class cloudera::cdh5::hadoop::fw::secondarynamenode (
  $srcnet = "0.0.0.0/0"
){
  firewall { '082 allow hadoop secondarynamenode' :
    port   => [1-65535], # was 50090, 56456
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class cloudera::cdh5::hadoop::fw::journalnode (
  $srcnet = "0.0.0.0/0"
){
  firewall { '082 allow hadoop journalnode' :
    port   => [1-65535], # was 8485
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class cloudera::cdh5::hadoop::fw::resourcemanager (
  $srcnet = "0.0.0.0/0"
){
  firewall { '083 allow hadoop yarn resourcemanager' :
    port   => [1-65535], # was 8030, 8031, 8032, 8033, 8088
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class cloudera::cdh5::hadoop::fw::historyserver (
  $srcnet = "0.0.0.0/0"
){
  firewall { '084 allow hadoop mapred historyserver' :
    port   => [1-65535], # was 10020, 10033, 19888
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class cloudera::cdh5::hadoop::fw::datanode (
  $srcnet = "0.0.0.0/0"
){
  firewall { '085 allow hadoop datanode' :
    port   => [1-65535], # was 50010, 50020, 50075, 51244
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class cloudera::cdh5::hadoop::fw::nodemanager (
  $srcnet = "0.0.0.0/0"
){
  firewall { '086 allow hadoop yarn nodemanager' :
    port   => [1-65535], # was 8040, 8042, 13562, 48314
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
  firewall { '087 allow hadoop yarn MapReduce AM' :
    port   => [1-65535], # was 50100-50200
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}
