class lumify(
  $web_server_host= $lumify::params::web_server_host,
  $lumify_war_file= $lumify::params::lumify_war_file,
  $target_war_location=$lumify::params::target_war_location,
)
inherits lumify::params
{
  class { '::lumify::deploy': }
  contain '::lumify::deploy'
}
