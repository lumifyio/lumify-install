class sysctl::max_file_descriptors (
) inherits sysctl::base {
  exec { "max_file_descriptors online" :
    command => "/sbin/sysctl -w fs.file-max=${fs_max_open_file_descriptors}",
    unless  => "/usr/bin/test $(/sbin/sysctl -n fs.file-max) -eq ${fs_max_open_file_descriptors}",
  } -> exec { "max_file_descriptors persistant" :
    command => "/bin/echo \"fs.file-max=${fs_max_open_file_descriptors}\" >> /etc/sysctl.conf",
    unless  => "/bin/grep -q fs.file-max=${fs_max_open_file_descriptors} /etc/sysctl.conf",
  }
}
