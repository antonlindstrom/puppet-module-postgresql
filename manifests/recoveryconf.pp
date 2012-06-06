class postgresql::recoveryconf(
  $version,
  $master_ip,
  $master_user,
  $master_password,
  $master_port='5432',
  $ensure='present'
) {

  file { 'recovery.conf':
    ensure  => $ensure,
    path    => "/var/lib/postgresql/${version}/main/recovery.conf",
    content => template('postgresql/recovery.conf.erb'),
    mode    => '0640',
    owner   => 'postgres',
    group   => 'postgres',
  }

}
