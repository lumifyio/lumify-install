class jai_imageio::install inherits jai_imageio {
  include '::macro'

  $imageio_url = "${lumify_global::download_base_url}/java/${jai_imageio_install_file}"
  $local_imageio = "${java::java_home}/${jai_imageio_install_file}"
  $jre_ext_lib_dir = "${java::java_home}/jre/lib/ext"

  macro::download { $imageio_url:
    path => $local_imageio,
    mode => '774',
  } -> exec { 'jai-imageio-license-accept':
    cwd     => $java::java_home,
    command => "/bin/sed -i \
                         -e 's|more <<EOF|cat > /dev/null <<EOF|' \
                         -e 's/agreed=$/agreed=1/' \
                         -e 's/^tail +/tail -n +/' \
                         ${local_imageio}",
  } -> exec { 'install-jai-imageio':
    cwd     => $java::java_home,
    command => $local_imageio,
    user    => 'root',
    group   => 'root',
    creates => [
      "${jre_ext_lib_dir}/jai_imageio.jar",
      "${jre_ext_lib_dir}/clibwrapper_jiio.jar",
    ],
  }
}
