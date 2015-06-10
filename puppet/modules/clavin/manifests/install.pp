class clavin::install inherits clavin {

  include '::macro'

  # make sure the clavin index directory exists, including any parent directories
  macro::ensure_dir{ "${clavin_index_dir}" : }

  $tmp_file = "${tmp_dir}/clavin-index.tgz"

  macro::download { 'clavin-index-download' :
    url  => $clavin_index_archive,
    path => $tmp_file,
  }

  macro::extract { $tmp_file :
    path    => $clavin_index_dir,
    require => [ File[$clavin_index_dir], Macro::Download['clavin-index-download'], ],
  }
}