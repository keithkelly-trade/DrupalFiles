class profile::app::access {
    service { 'snmp':
    ensure => running,
    }
}
