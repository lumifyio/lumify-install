class cloudera::cdh5::hadoop::hadoop (
  $pkg=$cloudera::cdh5::hadoop::params::pkg,
  $namenode_ipaddress = $cloudera::cdh5::hadoop::params::namenode_ipaddress,
  $namenode_rpc_address = $cloudera::cdh5::hadoop::params::namenode_rpc_address,
  $namenode_rpc_bind_host = $cloudera::cdh5::hadoop::params::namenode_rpc_bind_host,
  $namenode_hostname = $cloudera::cdh5::hadoop::params::namenode_hostname,
  $datanode_address = $cloudera::cdh5::hadoop::params::datanode_address,
  $datanode_ipc_address = $cloudera::cdh5::hadoop::params::datanode_ipc_address,
  $hadoop_masters = $cloudera::cdh5::hadoop::params::hadoop_masters,
  $hadoop_slaves = $cloudera::cdh5::hadoop::params::hadoop_slaves,
  $historyserver_hostname = $cloudera::cdh5::hadoop::params::historyserver_hostname,
  $hadoop_ha_enabled = $cloudera::cdh5::hadoop::params::hadoop_ha_enabled,
  $data_directories=$cloudera::cdh5::hadoop::params::data_directories,
  $hadoop_replication=$cloudera::cdh5::hadoop::params::hadoop_replication,
  $hadoop_ha_cluster_name=$cloudera::cdh5::hadoop::params::hadoop_ha_cluster_name
) inherits cloudera::cdh5::hadoop::params{
  class { '::cloudera::cdh5::repo': } ->
  class { '::cloudera::cdh5::hadoop::base':} ->
  class { '::cloudera::cdh5::hadoop::namenode':} ->
  class { '::cloudera::cdh5::hadoop::secondarynamenode':} ->
  class { '::cloudera::cdh5::hadoop::datanode':} ->
  class { '::cloudera::cdh5::hadoop::journalnode':} ->
  class { '::cloudera::cdh5::hadoop::zkfc':} ->
  class { '::cloudera::cdh5::hadoop::yarn::base':} ->
  class { '::cloudera::cdh5::hadoop::yarn::historyserver':} ->
  class { '::cloudera::cdh5::hadoop::yarn::nodemanager':} ->
  class { '::cloudera::cdh5::hadoop::yarn::resourcemanager':} ->
  class { '::cloudera::cdh5::config::pseudo':}
  contain '::cloudera::cdh5::repo'
  contain '::cloudera::cdh5::hadoop::base'
  contain '::cloudera::cdh5::hadoop::namenode'
  contain '::cloudera::cdh5::hadoop::secondarynamenode'
  contain '::cloudera::cdh5::hadoop::datanode'
  contain '::cloudera::cdh5::hadoop::journalnode'
  contain '::cloudera::cdh5::hadoop::zkfc'
  contain '::cloudera::cdh5::hadoop::yarn::base'
  contain '::cloudera::cdh5::hadoop::yarn::historyserver'
  contain '::cloudera::cdh5::hadoop::yarn::nodemanager'
  contain '::cloudera::cdh5::hadoop::yarn::resourcemanager'
  contain '::cloudera::cdh5::config::pseudo'
  notify{"Cloudera install under way param namenode_ipaddress: ${namenode_ipaddress}": }
}
