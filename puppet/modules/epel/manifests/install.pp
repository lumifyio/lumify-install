class epel::install inherits epel {
  package { 'epel-release':
    ensure => installed
  }
}