class jai::install inherits jai {
  include '::macro'

  $jai_url = "${lumify_global::download_base_url}/java/${jai_install_file}"
  $local_jai = "${java::java_home}/${jai_install_file}"
  $jre_ext_lib_dir = "${java::java_home}/jre/lib/ext"

  macro::download { $jai_url:
    path => $local_jai,
    mode => '774',
  } -> exec { 'jai-license-accept':
    cwd     => $java::java_home,
    command => "/bin/sed -i \
                         -e 's|more <<EOF|cat > /dev/null <<EOF|' \
                         -e 's/agreed=$/agreed=1/' \
                         ${local_jai}",
  } -> exec { 'install-jai':
    cwd     => $java::java_home,
    command => "$local_jai && /bin/rm -f ${local_jai}",
    user    => 'root',
    group   => 'root',
    creates => [
      "${jre_ext_lib_dir}/jai_core.jar",
      "${jre_ext_lib_dir}/jai_codec.jar",
      "${jre_ext_lib_dir}/mlibwrapper_jai.jar",
    ],
    require => Exec['jai-license-accept'],
  }
}
