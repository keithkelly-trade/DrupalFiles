class profile::os::windows::os_baseline_win2016dc {

  # Declare 'windows_firewall' resource
  class { 'windows_firewall' :
    ensure => running,
  }


  ###  SECTION: LOCAL FIREWALL - START
  
  # INBOUND RULE:  BES Client
  # REQUIRED FOR:  BigFix
  windows_firewall::exception { 'BES Client' :
    ensure => present,
    direction => 'in',
    action => 'allow',
    enabled => true,
    protocol => 'TCP',
    local_port => 'any',
    remote_port => 'any',
    display_name => 'BES Client',
  }
  
  ###  SECTION: LOCAL FIREWALL - END


  ###  SECTION: WIN 2016 STIG REQUIREMENTS - START
 
  registry::value { 'Network access: Restrict clients allowed to make remote calls to SAM' :
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa',
    value => 'RestrictRemoteSam',
    data  => 'o:bag:bad:(a;;rc;;;ba)',
  }

  registry::value { 'NetBIOS node type' :
    key   => 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters',
    value => 'NodeType',
    data  => '2',
    type  => 'dword',
  }

  registry::value { 'Continue experiences on this device' :
    key   => 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\System',
    value => 'EnableCdp',
    data  => '1',
    type  => 'dword',
  }

  ###  SECTION: WIN 2016 STIG REQUIREMENTS - END


  ###  SECTION: SERVICES - START

  # SERVICE: Amazon SSM Agent
  service { 'AmazonSSMAgent' :
    ensure => running,
  }

  # SERVICE: AWS Lite Guest Agent
  service { 'AWSLiteAgent' :
    ensure => running,
  }

  # SERVICE: Background Tasks Infrastructure Service
  service { 'BrokerInfrastructure' :
    ensure => running,
  }

  # SERVICE: Base Filtering Engine
  service { 'BFE' :
    ensure => running,
  }

  # SERVICE: BES Client
  service { 'BESClient' :
    ensure => running,
  }

  # SERVICE: Cb Protection Agent
  service { 'Parity' :
    ensure => running,
  }

  # SERVICE: CDPUserSvc_3c45d6b
  service { 'CDPUserSvc_3c45d6b' :
    ensure => running,
  }

  # SERVICE: Certificate Propogation
  service { 'CertPropSvc' :
    ensure => running,
  }

  # SERVICE: CNG Key Isolation
  service { 'KeyIso' :
    ensure => running,
  }

  # SERVICE: COM+ Event System
  service { 'EventSystem' :
    ensure => running,
  }

  # SERVICE: Configuration Manager Remote Control
  service { 'CmRcService' :
    ensure => running,
  }

  # SERVICE: CoreMessaging
  service { 'CoreMessagingRegistrar' :
    ensure => running,
  }

  # SERVICE: Credential Manager
  service { 'VaultSvc' :
    ensure => running,
  }

  # SERVICE: CrowdStrike Falcon Sensor Service
  service { 'CSFalconService' :
    ensure => running,
  }

  # SERVICE: Cryptographic Services
  service { 'CryptSvc' :
    ensure => running,
  }

  # SERVICE: Data Sharing Service
  service { 'DsSvc' :
    ensure => running,
  }

  # SERVICE: DCOM Server Process Launcher
  service { 'DcomLaunch' :
    ensure => running,
  }

  # SERVICE: DFS Namespace
  service { 'Dfs' :
    ensure => running,
  }

  # SERVICE: DFS Replication
  service { 'DFSR' :
    ensure => running,
  }

  # SERVICE: DHCP Client
  service { 'Dhcp' :
    ensure => running,
  }

  # SERVICE: Diagnostic Policy Service
  service { 'DPS' :
    ensure => running,
  }

  # SERVICE: Distributed Link Tracking Client
  service { 'TrkWks' :
    ensure => running,
  }

  # SERVICE: Distributed Transaction Coordinator
  service { 'MSDTC' :
    ensure => running,
  }

  # SERVICE: DNS Client
  service { 'Dnscache' :
    ensure => running,
  }

  # SERVICE: Geolocation Service
  service { 'lfsvc' :
    ensure => running,
  }

  # SERVICE: Group Policy Client
  service { 'gpsvc' :
    ensure => running,
  }

  # SERVICE: IKE and AuthIP IPsec Keying Modules
  service { 'IKEEXT' :
    ensure => running,
  }

  # SERVICE: IP Helper
  service { 'iphlpsvc' :
    ensure => running,
  }

  # SERVICE: IPsec Policy Agent
  service { 'PolicyAgent' :
    ensure => running,
  }

  # SERVICE: Local Session Manager
  service { 'LSM' :
    ensure => running,
  }

  # SERVICE: Netlogon
  service { 'Netlogon' :
    ensure => running,
  }

  # SERVICE: Network Connection Broker
  service { 'NcbService' :
    ensure => running,
  }

  # SERVICE: Network List Service
  service { 'netprofm' :
    ensure => running,
  }

  # SERVICE: Network Location Awareness
  service { 'NlaSvc' :
    ensure => running,
  }

  # SERVICE: Network Store Interface Service
  service { 'nsi' :
    ensure => running,
  }

  # SERVICE: Plug and Play
  service { 'PlugPlay' :
    ensure => running,
  }

  # SERVICE: Power
  service { 'Power' :
    ensure => running,
  }

  # SERVICE: Print Spooler
  service { 'Spooler' :
    ensure => running,
  }

  # SERVICE: Program Compatibility Assistant Service
  service { 'PcaSvc' :
    ensure => running,
  }

  # SERVICE: Puppet Agent
  #service { 'puppet' :
  #  ensure => running,
  #}

  # CANNOT BE REDECLARED
  # SERVICE: Puppet PXP Agent
  #service { 'pxp-agent' :
  #  ensure => running,
  #}

  # SERVICE: Remote Desktop Configuration
  service { 'SessionEnv' :
    ensure => running,
  }

  # SERVICE: Remote Desktop Services
  service { 'TermService' :
    ensure => running,
  }

  # SERVICE: Remote Desktop Services UserMode Port Director
  service { 'UmRdpService' :
    ensure => running,
  }

  # SERVICE: Remote Procedure Call (RPC)
  service { 'RpcSs' :
    ensure => running,
  }

  # SERVICE: RPC Endpoint Mapper
  service { 'RpcEptMapper' :
    ensure => running,
  }

  # SERVICE: Security Accounts Manager
  service { 'SamSs' :
    ensure => running,
  }

  # SERVICE: Server
  service { 'LanmanServer' :
    ensure => running,
  }

  # SERVICE: Shell Hardware Detection
  service { 'ShellHWDetection' :
    ensure => running,
  }

  # SERVICE: Smart Card Device Enumeration Service
  service { 'ScDeviceEnum' :
    ensure => running,
  }

  # SERVICE: SMS Agent Host
  service { 'CcmExec' :
    ensure => running,
  }

  # SERVICE: SNMP Service
  service { 'SNMP' :
    ensure => running,
  }

  # SERVICE: Splunk Forwarder Service
  service { 'SplunkForwarder' :
    ensure => running,
  }

  # SERVICE: SSDP Discovery
  service { 'SSDPSRV' :
    ensure => running,
  }

  # SERVICE: State Repository Service
  service { 'StateRepository' :
    ensure => running,
  }

  # SERVICE: Sync Host_3c45d6b
  service { 'OneSyncSvc_3c45d6b' :
    ensure => running,
  }

  # SERVICE: System Event Notification Service
  service { 'SENS' :
    ensure => running,
  }

  # SERVICE: System Events Broker
  service { 'SystemEventsBroker' :
    ensure => running,
  }

  # SERVICE: Task Scheduler
  service { 'Schedule' :
    ensure => running,
  }

  # SERVICE: TCP/IP NetBIOS Agent
  service { 'lmhosts' :
    ensure => running,
  }

  # SERVICE: Themes
  service { 'Themes' :
    ensure => running,
  }

  # SERVICE: Tile Data Model Server
  service { 'tiledatamodelsvc' :
    ensure => running,
  }

  # SERVICE: Time Broker
  service { 'TimeBrokerSvc' :
    ensure => running,
  }

  # SERVICE: User Access Logging Service
  service { 'UALSVC' :
    ensure => running,
  }

  # SERVICE: User Manager
  service { 'UserManager' :
    ensure => running,
  }

  # SERVICE: User Profile Service
  service { 'ProfSvc' :
    ensure => running,
  }

  # SERVICE: Virtual Disk
  service { 'vds' :
    ensure => running,
  }

  # SERVICE: Windows Correction Manager
  service { 'Wcmsvc' :
    ensure => running,
  }

  # SERVICE: Windows Defender Network Inspection Service
  service { 'WdNisSvc' :
    ensure => running,
  }

  # SERVICE: Windows Defender Service
  service { 'WinDefend' :
    ensure => running,
  }

  # SERVICE: Windows Event Log
  service { 'EventLog' :
    ensure => running,
  }

  # CANNOT BE REDECLARED
  # SERVICE: Windows Firewall
  #service { 'MpsSvc' :
  #  ensure => running,
  #}

  # SERVICE: Windows Font Cache Service
  service { 'FontCache' :
    ensure => running,
  }

  ###  SECTION: SERVICES - END

}
