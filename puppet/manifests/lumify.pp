node /lumify\d*\.vm\.local/ {
  include role::jetty
  include role::lumify
}