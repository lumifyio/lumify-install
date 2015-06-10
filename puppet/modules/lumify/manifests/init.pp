class lumify(
  $web_server_host= $lumify::params::web_server_host,
  $lumify_war_file= $lumify::params::lumify_war_file,
  $target_war_location=$lumify::params::target_war_location,
  $lumify_dir=$lumify::params::lumify_dir,
  $lumify_config_dir=$lumify::params::lumify_config_dir,
  $lumify_log_dir=$lumify::params::lumify_log_dir,
  $securegraph_user=$lumify::params::securegraph_user,
  $securegraph_password=$lumify::params::securegraph_password,
  $accumulo_user=$lumify::params::accumulo_user,
  $accumulo_password=$lumify::params::accumulo_password,
  $hadoop_namenode=$lumify::params::hadoop_namenode,
  $zookeeper_quorum=$lumify::params::zookeeper_quorum,
  $rabbitmq_nodes=$lumify::params::rabbitmq_nodes,
  $elastic_search_locations=$lumify::params::elastic_search_locations,
  $google_analytics_key=$lumify::params::google_analytics_key,
  $google_analytics_domain=$lumify::params::google_analytics_domain,
  $bing_clientId=$lumify::params::bing_clientId,
  $bing_secret=$lumify::params::bing_secret,
  $terms_of_use_title=$lumify::params::terms_of_use_title,
  $terms_of_use_html=$lumify::params::terms_of_use_html,
  $oauth_twitter_key=$lumify::params::oauth_twitter_key,
  $oauth_twitter_secret=$lumify::params::oauth_twitter_secret,
  $oauth_google_key=$lumify::params::oauth_google_key,
  $oauth_google_secret=$lumify::params::oauth_google_secret,
  )
inherits lumify::params
{
  class { '::lumify::config': }
  class { '::lumify::deploy': }
  contain '::lumify::config'
  contain '::lumify::deploy'
}
