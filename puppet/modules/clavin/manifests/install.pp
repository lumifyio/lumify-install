class clavin::install inherits clavin {

  include '::macro'

  $tmp_file = "${tmp_dir}/clavin-index.tgz"

  macro::ensure_dir{ "${clavin_index_dir}" :
  } -> macro::download { 'clavin-index-download' :
    url  => $clavin_index_archive,
    path => $tmp_file,
    require => Macro::Ensure_dir[$clavin_index_dir],
  } -> macro::extract { $tmp_file :
    path    => $clavin_index_dir,
    require => [ Macro::Download['clavin-index-download'], ],
  }
}