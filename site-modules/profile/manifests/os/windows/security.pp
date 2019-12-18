# This profile is example of security configurations for 
# site specific security settings.
class profile::os::windows::security (
  Boolean $reporting_only = true,
  Boolean $disable_ipv6 = true,
  Boolean $enable_rdesktop = false,
) {
  if $reporting_only {
    noop()
  }
  if $disable_ipv6 {
    include profile::os::windows::disable_ipv6
  }
  if $enable_rdesktop {
    include profile::os::windows::enable_remote_desktop
  }
# This code was pulled out due to module versions not supporting Puppet >6.0.0 
#  if $facts['os']['release']['major'] != '2012 R2' {
#    contain secure_windows
#  }
}
