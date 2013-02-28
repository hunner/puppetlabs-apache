class apache::mod::reqtimeout {
  apache::mod { 'reqtimeout': }
  # Template uses no variables
  file { 'reqtimeout.conf':
    ensure  => present,
    path    => "${apache::params::mod_dir}/reqtimeout.conf",
    content => template('apache/mod/reqtimeout.conf.erb'),
  }
}
