class raid_zero_partition::install inherits raid_zero_partition {

  $num_drives = 0 + inline_template("<%= @drives.length %>")
  $drives_str = inline_template("<%= @drives.map{|d| d + '1'}.join(' ') %>")

  $drives.each |$drive| {
    exec { "fdisk-$drive" :
      command => "/bin/bash -c \"(/bin/echo n; /bin/echo p; /bin/echo 1; /bin/echo; /bin/echo; /bin/echo t; /bin/echo fd; /bin/echo w) | /sbin/fdisk ${drive}\"",
    }
  }

  exec { 'mdadm-raid0-array' :
    command => "/sbin/mdadm --create --verbose /dev/md0 --level=0 --raid-devices=${num_drives} ${drives_str}",
  } -> exec { 'save-raid0-array-config':
    command => '/bin/echo \'DEVICE /dev/xvd*[0-9]\' > /etc/mdadm.conf && /sbin/mdadm --detail --scan >> /etc/mdadm.conf',
  } -> exec { 'set-raid0-array-rebuild-speed':
    command => '/bin/echo "15000" > /proc/sys/dev/raid/speed_limit_min',
  } -> exec { 'mkfs-raid0-array':
    command => '/sbin/mkfs -V -t ext4 /dev/md0',
  } -> exec { 'mkdir-raid0-array-mount-dir':
    command => '/bin/mkdir -p /data0',
  } -> exec { 'mount-raid0-array':
    command => '/bin/mount -v -t ext4 /dev/md0 /data0',
  } -> exec { 'fstab-raid0-array':
    command => '/bin/echo \'/dev/md0 /data0 ext4 defaults 1 2\' >> /etc/fstab',
  }
}