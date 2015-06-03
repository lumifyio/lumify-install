class cloudera::cdh5::zookeeper::install inherits cloudera::cdh5::zookeeper::zookeeper {

  include '::java'
  include '::cloudera::cdh5::repo'

  package { 'zookeeper-server':
    ensure  => installed,
    require => Class['java', 'cloudera::cdh5::repo'],
  }
}