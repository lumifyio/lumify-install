class repo::lumify {
  yumrepo { 'bits.lumify.io':
    descr    => 'Lumify repository',
    baseurl  => 'http://bits.lumify.io/yum',
    gpgcheck => 0,
    enabled  => 1,
  }
}
