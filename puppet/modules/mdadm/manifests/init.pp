class mdadm {
  class { '::mdadm::install': }
  contain '::mdadm::install'
}