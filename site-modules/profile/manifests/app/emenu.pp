class profile::app::emenu {
  service { 'snmp' :
	ensure => running,
}
}
