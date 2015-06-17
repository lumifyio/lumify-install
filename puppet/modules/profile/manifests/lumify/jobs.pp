class profile::lumify::jobs {
class { '::lumify::gpw::deploy': }
class { '::lumify::yarn::deploy': }
class { '::lumify::yarn::run': }
}