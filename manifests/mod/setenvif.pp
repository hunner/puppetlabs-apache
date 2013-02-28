class apache::mod::setenvif {
  apache::mod { 'setenvif': }
  # Template uses no variables
  file { 'setenvif.conf':
    ensure  => present,
    path    => "${apache::params::mod_dir}/setenvif.conf",
    content => template('apache/mod/setenvif.conf.erb'),
  }
}
