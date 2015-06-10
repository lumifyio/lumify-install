class lumify::params{
  $web_server_host = [ "${ipaddress_eth1}", ]
  $lumify_war_file='/vagrant/deploy/web/lumify.war'
  $target_war_location='/opt/jetty/webapps/lumify.war'
  $clavin_index_dir='/opt/lumify/clavin-index'
  $lumify_dir='/opt/lumify'
  $lumify_config_dir='/opt/lumify/config'
  $lumify_logs_dir='/opt/lumify/logs'
  $securegraph_user='root'
  $securegraph_password='password'
  $accumulo_user='root'
  $accumulo_password='password'
  $hadoop_namenode='lumify-dev'
  $zookeeper_quorum='lumify-dev'
  $elastic_search_locations='lumify-dev'
  $google_analytics_key='UA-74388-18'
  $google_analytics_domain='lumify-dev'
  $bing_clientId='b75468f1-5ee0-434f-a1ca-87ab04b1a897'
  $bing_secret='4PLv4+za8ogRIRYJzLfVGbbrCLzuY+8w/G+wqRZmdRM'
  $terms_of_use_title='try.lumify.io Terms of Use'
  $terms_of_use_html='<p>This is a demonstration instance of Lumify. Features and data may change at any time.</p><p>Please see <a href="http://lumify.io/try">http://lumify.io/try</a> for more information.</p>'
  $oauth_twitter_key='llHKLPSHT1YZlFjQBVCtdDB2i'
  $oauth_twitter_secret='BPqVbjxKn9J0usjzGDZSSau4KccJro6FT8T1XO4ALG01HHmNsw'
  $oauth_google_key='1045232169465-ds6ockb84tbqav9dettpm52ijaf7j64b.apps.googleusercontent.com'
  $oauth_google_secret='QUgK2a-T8zKKqeu-qe6lKPnY'



  if $interfaces =~ /bond0/ {
    $rabbit_node_ip = $ipaddress_bond0
  } elsif $interfaces =~ /eth1/ {
    $rabbit_node_ip = $ipaddress_eth1
  } elsif $interfaces =~ /em2/ {
    $rabbit_node_ip = $ipaddress_em2
  } else {
    $rabbit_node_ip = $ipaddress_eth0
  }

  $rabbitmq_nodes      = { '1' => "${rabbit_node_ip}" }
}