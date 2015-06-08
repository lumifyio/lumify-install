# Installs and configures Oracle JDK from a managed package,
# configuring the JAVA_HOME environment variable based on the
# provided directory.
#
# $java_version: the version of the JDK; default: 7u79
# $java_home: the location of JAVA_HOME post-install; default: /usr/java/default
# $rpm_source: indicates whether RPM should be downloaded from a URL ('download') or is present
#              in a package manager repository ('repo'); default: 'download'
class java (
  $java_version = $java::params::java_version,
  $java_home    = $java::params::java_home,
  $rpm_source   = $java::params::rpm_source,
) inherits java::params {
  class { '::java::install': } ->
  class { '::java::config': }

  contain '::java::install'
  contain '::java::config'
}
