class profile::app::mim {
service {'snmp':
  ensure => running,
}
}
