class profile::elasticsearch::node {
  class { '::java': }
  class { '::elasticsearch': }
}