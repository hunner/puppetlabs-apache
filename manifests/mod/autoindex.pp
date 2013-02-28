class apache::mod::autoindex {
  apache::mod { 'autoindex': }
  # Template uses no variables
  file { 'autoindex.conf':
    ensure  => present,
    path    => "${apache::params::mod_dir}/autoindex.conf",
    content => template('apache/mod/autoindex.conf.erb'),
  }
}
