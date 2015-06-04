class accumulo::fw::logger (
  $srcnet = "0.0.0.0/0"
){
  firewall { '011 allow accumulo logger' :
    port   => [11224],
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class accumulo::fw::tserver (
  $srcnet = "0.0.0.0/0"
){
  firewall { '012 allow accumulo tserver' :
    port   => [9997],
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class accumulo::fw::master (
  $srcnet = "0.0.0.0/0"
){
  firewall { '013 allow accumulo master' :
    port   => [9999],
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class accumulo::fw::gc (
  $srcnet = "0.0.0.0/0"
){
  firewall { '014 allow accumulo gc' :
    port   => [50091],
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class accumulo::fw::monitor (
  $srcnet = "0.0.0.0/0"
){
  firewall { '015 allow accumulo monitor' :
    port   => [4560, 50095],
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}

class accumulo::fw::tracer (
  $srcnet = "0.0.0.0/0"
){
  firewall { '016 allow accumulo tracer' :
    port   => [12234],
    proto  => tcp,
    action => accept,
    source => "${srcnet}",
  }
}
