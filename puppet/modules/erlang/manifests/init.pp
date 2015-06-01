class erlang {
  class { '::erlang::install': }
  contain '::erlang::install'
}