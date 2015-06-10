class lumify::params{
  $web_server_host = [ "${ipaddress_eth1}", ]
  $lumify_war_file='/vagrant/deploy/web/lumify.war'
  $target_war_location='/opt/jetty/webapps/lumify.war'
  $lumify_dir='/opt/lumify'
  $lumify_config_dir='/opt/lumify/config'
  $securegraph_user='root'
  $securegraph_password='password'
  $accumulo_user='root'
  $accumulo_password='password'
  $hadoop_namenode='lumify-dev'
  $zookeeper_quorum='lumify-dev'
  $elastic_search_locations='lumify-dev'

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