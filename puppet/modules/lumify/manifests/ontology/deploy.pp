class lumify::ontology::deploy inherits lumify {

  include '::macro'

  macro::ensure_dir{ "$lumify_ontologies_dir/minimal" :
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rx,go=rx',
  }

  file { "$lumify_ontologies_dir/minimal":
    source  => "$target_ontologies_dir/ontology-minimal",
    recurse => true,
    require => Macro::Ensure_dir['/opt/lumify/ontologies/minimal'],
    owner   => 'lumify',
    group   => 'lumify',
    mode    => 'u=rx,go=rx',
  }
}