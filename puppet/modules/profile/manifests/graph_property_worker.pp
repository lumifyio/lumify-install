# Defines the packages required for a node that will run the
# GraphPropertyWorker processes.
class profile::graph_property_worker {
#  class { '::java': }
  class { '::jai': }
  class { '::jai_imageio': }
  class { '::opencv': }
  class { '::tesseract': }
  class { '::sphinx': }
  class { '::ccextractor': }
  class { '::ffmpeg': }
  class { '::clavin': }
}
