# Defines the packages required for a node that will run the
# Elasticsearch processes.
class profile::epel {
  class { '::epel': }
}
