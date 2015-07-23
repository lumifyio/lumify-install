class lumify::params{
  $web_server_host = [ "${ipaddress_eth1}", ]
  $lumify_war_file='/vagrant/deploy/deployment/web/lumify.war'
  $lumify_deployed_libs='/vagrant/deploy/deployment/web/lib'
  $target_war_location='/opt/jetty/webapps/lumify.war'
  $lumify_xml_file='/vagrant/deploy/deployment/lumify.xml'
  $target_lumify_context='/opt/jetty/webapps/lumify.xml'
  $lumify_dir='/opt/lumify'
  $lumify_config_dir="$lumify_dir/config"
  $lumify_config_src_dir='/vagrant/deploy/deployment/config'
  $lumify_logs_dir="$lumify_dir/logs"
  $lumify_target_lib_dir="$lumify_dir/lib"
  $clavin_index_dir="$lumify_dir/clavin-index"
  $lumify_version="0.5.0-SNAPSHOT"

  $securegraph_user='root'
  $securegraph_password='password'
  $accumulo_user='root'
  $accumulo_password='password'
  $hadoop_namenode='lumify-dev'
  $zookeeper_quorum= { 1 => 'lumify-dev'}
  $elastic_search_cluster_name='lumify_elasticsearch'
  $elastic_search_locations= ['lumify-dev']
  $google_analytics_key='UA-74388-18'
  $google_analytics_domain='lumify-dev'
  $geocoder_bing_key='AglRx99YVSldfAyhLffDA2215ldiNX6Firc0FYJeLSgDLKb7qR0WsyTbqWPnDbr8'
  $bing_clientId='b75468f1-5ee0-434f-a1ca-87ab04b1a897'
  $bing_secret='4PLv4+za8ogRIRYJzLfVGbbrCLzuY+8w/G+wqRZmdRM'
  $terms_of_use_title='try.lumify.io Terms of Use'
  $terms_of_use_html='<p>This is a demonstration instance of Lumify. Features and data may change at any time.</p><p>Please see <a href="http://lumify.io/try">http://lumify.io/try</a> for more information.</p>'
  $oauth_twitter_key='llHKLPSHT1YZlFjQBVCtdDB2i'
  $oauth_twitter_secret='BPqVbjxKn9J0usjzGDZSSau4KccJro6FT8T1XO4ALG01HHmNsw'
  $oauth_google_key='1045232169465-ds6ockb84tbqav9dettpm52ijaf7j64b.apps.googleusercontent.com'
  $oauth_google_secret='QUgK2a-T8zKKqeu-qe6lKPnY'
  $target_gpw_jar_location="/tmp/gpw"
  $lumify_gpw_jars='/vagrant/deploy/deployment/gpw'
  $target_yarn_jar_location="/tmp/yarn"
  $lumify_yarn_jars='/vagrant/deploy/deployment/yarn'
  $target_tools_jar_location="/tmp/tools"
  $lumify_tools_jars='/vagrant/deploy/deployment/tools'
  $target_config_location="/tmp/config"
  $lumify_hdfs_gpw_directory="/lumify/libcache"
  $lumify_hdfs_yarn_directory="/lumify/libcache"
  $lumify_hdfs_config_directory="/lumify/config"
  $lumify_ontologies_dir='/vagrant/deploy/deployment/ontologies/ontology-minimal'

  $target_ontologies_dir='/opt/lumify/ontologies/minimal'
  $forgot_pass_server_hostname=''
  $forgot_pass_server_port=''
  $forgot_pass_server_username=''
  $forgot_pass_server_password=''
  $forgot_pass_from_email=''
  $forgot_pass_admin_email=''

  $ldap_primary_server='192.168.33.10'
  $ldap_primary_port='636'
  $ldap_failover_server=''
  $ldap_failover_port='636'
  $ldap_max_connections='10'
  $ldap_bind_password='lumify'
  $ldap_truststore='/opt/lumify/config/lumify-ca.jks'
  $ldap_truststore_password='password'
  $ldap_truststore_type='JKS'
  $ldap_user_search_scope='sub'
  $ldap_group_search_scope='sub'
  $ldap_auth_clientdn_header='SSL_CLIENT_S_DN'
  $ldap_auth_clientcert_header='SSL_CLIENT_CERT'
  $ldap_auth_required_attr='role'
  $ldap_auth_required_attr_vals=''
  $ldap_auth_required_groups=''
  $ldap_auth_username_attr='employeeNumber'
  $ldap_auth_displayname_attr='displayName'

  $analysts_menuopt1_label='6'
  $analysts_menuopt1_value='VERSION_6'
  $analysts_menuopt2_label='7'
  $analysts_menuopt2_value='VERSION_7'
  $analysts_menuopt3_label='8.5.1'
  $analysts_menuopt3_value='VERSION_8_5_1'
  $analysts_menuopt4_label='8.9'
  $analysts_menuopt4_value='VERSION_8_9'
  $analysts_enable_custom_img_collect='true'
  $analysts_enable_icon_pic='true'
  $analysts_thmbnail_width='200'
  $analysts_thmbnail_height='200'
  $analysts_include_props='true'
  $analysts_include_subtitle='true'
  $analysts_include_time='true'
  $analysts_include_img_url='true'
  $analysts_include_visib='true'
  $analysts_include_visib_label='Classification'
  $analysts_acc_service_url=''
  $analysts_acc_param_name=''
  $analysts_acc_truststore_path=''
  $analysts_acc_truststore_password=''
  $analysts_acc_disable_hostname_verif='false'

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