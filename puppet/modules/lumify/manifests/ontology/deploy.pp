class lumify::ontology::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "/opt/lumify/ontologies/minimal" :
    owner   => 'jetty',
    group   => 'jetty',
    mode    => 'u=rx,go=rx',
  }

  file { "/opt/lumify/ontologies/minimal":
    source  => "$lumify_ontologies_dir/ontology-minimal",
    recurse => true,
    require => Macro::Ensure_dir['/opt/lumify/ontologies/minimal'],
  }
}