class profile::hadoop {
  class { '::cloudera::cdh5::hadoop::hadoop': }
}