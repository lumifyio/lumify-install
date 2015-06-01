class erlang::install inherits erlang {
  package { 'erlang' :
    ensure   => installed,
    require  => Class['::epel'],
  }
}