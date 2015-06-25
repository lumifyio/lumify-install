class lumify::ontology::deploy (
) inherits lumify::params {

  include '::macro'

  macro::ensure_dir{ "/opt/lumify/ontologies/minimal" :
    owner   => 'jetty',
    group   => 'jetty',
    mode    => 'u=rx,go=rx',
  }

  file { "/opt/lumify/ontologies/minimal":
    source  => "/vagrant/deploy/deployment/ontologies/ontology-minimal",
    recurse => true,
    require => Macro::Ensure_dir['/opt/lumify/ontologies/minimal'],
  }
}