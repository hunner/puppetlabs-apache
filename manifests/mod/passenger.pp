class apache::mod::passenger (
  $passengerhighperformance   = off,
  $passengerpoolidletime      = 300,
  $passengermaxrequests       = 0,
  $passengerstatthrottlerate  = 0,
  $rackautodetect             = on,
  $railsautodetect            = on
  $passenger_root          = $apache::params::passenger_root,
  $passenger_ruby          = $apache::params::passenger_ruby,
  $passenger_max_pool_size = undef,
) {
  # Could do some sanity checking of the parameters here.

  # you could just do this, but no options would be configured!
  apache::mod { 'passenger': }
  # Template uses: $passenger_root, $passenger_ruby, $passenger_max_pool_size
  file { 'passenger.conf':
    ensure  => file,
    path    => "${apache::mod_dir}/passenger.conf",
    content => template('apache/mod/passenger.conf.erb'),
  }
}
