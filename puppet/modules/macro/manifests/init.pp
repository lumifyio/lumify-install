class macro {
  include '::tools::unzip'
  include '::lumify_global'

  # Downloads a file from the provided URL.
  #
  # $url: The URL of the file to download; defaults to the title of the task.
  # $path: The full path, including destination file name, where the file will be downloaded.
  # $mode: The permissions mode of the downloaded file; may be specified in octal or symbolic notation
  # $timeout: The maximum amount of time, in seconds, allowed for the download; default: 300.
  # $cookie: The cookie(s) that should be sent with the request; default: nil.
  define download($url=$title, $path, $mode=nil, $timeout=300, $cookie=nil) {
    $proxy = $lumify_global::proxy_url

    if ($proxy != nil) {
      $proxy_opt = "--proxy ${proxy}"
    } else {
      $proxy_opt = ''
    }

    if ($cookie != nil) {
      $cookie_opt = "-b ${cookie}"
    } else {
      $cookie_opt = ''
    }

    info "Downloading ${url} ..."
    exec { "download-${url}":
      cwd     => $lumify_global::tmp_dir,
      command => "/usr/bin/curl ${cookie_opt} -s -L --fail -o ${path} ${proxy_opt} '${url}'",
      creates => $path,
      unless  => "/usr/bin/test -f ${path}",
      timeout => $timeout,
    }

    unless ($mode == nil) {
      file { $path:
        ensure  => file,
        mode    => $mode,
        require => Exec["download-${url}"],
      }
    }
  }

  # Extracts the contents of a compressed file.
  #
  # $file: The file to extract; default to the title of the task.
  # $type: The type of file: 'zip', 'gzip', 'tar' or 'tgz'; default: 'tgz'
  # $user: The user that will own the extracted files; default: 'root'
  # $group: The group that will own the extracted files; default: 'root'
  # $path: The path where the file will be extracted
  # $options: Additional options for the extraction task; default: ''
  # $creates: A file that can be used to verify the extraction; default: ''
  define extract($file=$title, $type='tgz', $user='root', $group='root', $path, $options='', $creates='') {
    case $type {
      'zip':   { $cmd = "/usr/bin/unzip -qo ${options}" }
      'gzip':  { $cmd = "/bin/gunzip ${options}" }
      'tar':   { $cmd = "/bin/tar ${options} -xf" }
      'tgz':   { $cmd = "/bin/tar ${options} -xzf" }
      default: { fail "Unsupported archive type: ${type}" }
    }

    info "Extracting ${file} ..."
    if ($creates == '') {
      exec { "extract-${file}":
        cwd     => $path,
        command => "${cmd} ${file}",
        user    => $user,
        group   => $group,
        require => Class['tools::unzip'],
      }
    } else {
      exec { "extract-${file}":
        cwd     => $path,
        command => "${cmd} ${file}",
        creates => $creates,
        user    => $user,
        group   => $group,
        require => Class['tools::unzip'],
      }
    }
  }

  # TLH - this probably shouldn't be used in modules
  define know_our_host_key ($user, $sshdir, $hostname) {
    exec { "know-our-host-key-${user}-${hostname}" :
      command => "/bin/echo \"${hostname} $(/bin/cat /etc/ssh/ssh_host_rsa_key.pub)\" >> ${sshdir}/known_hosts",
      user    => $user,
      unless  => "/bin/grep -q \"${hostname} $(/bin/cat /etc/ssh/ssh_host_rsa_key.pub)\" ${sshdir}/known_hosts",
    }
  }

  # TLH - this probably shouldn't be used in modules
  define setup_passwordless_ssh ($user=$title, $sshdir) {
    exec { "generate-ssh-keypair-${user}" :
      command => "/usr/bin/ssh-keygen -b 2048 -f ${sshdir}/id_rsa -N ''",
      user    => $user,
      creates => "${sshdir}/id_rsa",
    }

    exec { "authorize-ssh-key-${user}" :
      command => "/bin/cat ${sshdir}/id_rsa.pub >> ${sshdir}/authorized_keys",
      user    => $user,
      unless  => "/bin/grep -q \"$(/bin/cat ${sshdir}/id_rsa.pub)\" ${sshdir}/authorized_keys",
      require => Exec["generate-ssh-keypair-${user}"],
    }

    macro::know_our_host_key { "${user}-localhost" :
      user     => $user,
      sshdir   => $sshdir,
      hostname => 'localhost',
      require  => Exec["generate-ssh-keypair-${user}"],
    }

    macro::know_our_host_key { "${user}-${ipaddress_eth1}" :
      user     => $user,
      sshdir   => $sshdir,
      hostname => $ipaddress_eth1,
      require  => Exec["generate-ssh-keypair-${user}"],
    }
  }
}
