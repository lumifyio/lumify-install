class cloudera::cdh5::hadoop::yarn::base inherits cloudera::cdh5::hadoop::hadoop {
  include cloudera::cdh5::hadoop::base

  case $architecture {
    'x86_64': {
                $yarn_pkg = 'hadoop-yarn.x86_64'
                $mapred_pkg = 'hadoop-mapreduce.x86_64'
              }
    'i386':   {
                $yarn_pkg = 'hadoop-yarn.i686'
                $mapred_pkg = 'hadoop-mapreduce.i686'
              }
    default:  { fail "unsupported architecture: ${architecture}" }
  }
  $namenode_hostname = $cloudera::cdh5::hadoop::base::namenode_hostname

  package { [$yarn_pkg, $mapred_pkg]:
    ensure  => installed,
    require => Package[$cloudera::cdh5::hadoop::base::pkg],
  }

  file { "/etc/hadoop/conf/yarn-site.xml":
    ensure  => file,
    content => template("cloudera/yarn-site.xml.erb"),
    owner   => "root",
    group   => "root",
    mode    => "u=rw,go=r",
    require => Package[$yarn_pkg],
  }
}
