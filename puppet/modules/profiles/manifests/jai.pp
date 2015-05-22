class profiles::jai {
  class { '::java': }
  class { '::jai': }
  class { '::jai_imageio': }
}
