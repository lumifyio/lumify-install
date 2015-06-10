class lumify(
  $web_server_host= $lumify::params::web_server_host,
  $lumify_war_file= $lumify::params::lumify_war_file,
  $target_war_location=$lumify::params::target_war_location,
  $lumify_dir=$lumify::params::lumify_dir,
  $lumify_config_dir=$lumify::params::lumify_config_dir,
  $securegraph_user=$lumify::params::securegraph_user,
  $securegraph_password=$lumify::params::securegraph_password,
  $accumulo_user=$lumify::params::accumulo_user,
  $accumulo_password=$lumify::params::accumulo_password,
  $hadoop_namenode=$lumify::params::hadoop_namenode,
  $zookeeper_quorum=$lumify::params::zookeeper_quorum,
  $rabbitmq_nodes=$lumify::params::rabbitmq_nodes,
  $elastic_search_locations=$lumify::params::elastic_search_locations,
  )
inherits lumify::params
{
  class { '::lumify::config': }
  class { '::lumify::deploy': }
  contain '::lumify::config'
  contain '::lumify::deploy'
}
