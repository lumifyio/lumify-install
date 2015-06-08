node /ac\d*\.vm\.local/ {
  include '::role::accumulo_head'
  include '::role::accumulo_node'
}
