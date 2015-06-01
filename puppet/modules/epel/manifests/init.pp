class epel {
  class { '::epel::install': }
  contain '::epel::install'
}