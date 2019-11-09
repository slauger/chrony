# chrony
#
# Main class for chrony module, includes all other classes.
#
# @param bindaddress [String] A specific address to listen for NTP requests. Default value: undef
# @param client_allow [Boolean] Whether to allow clients to connect. Default value: false.
# @param client_sources [Optional Array[String]] The sources (networks or hostnames) from which clients will be allowed to connect. Default value: undef.
# @param config [Stdlib::Absolutepath] The path to the config file. Default value: varies by OS.
# @param config_file_mode [String] The mode to set on the config file. Default value: 0664.
# @param config_manage [Boolean] Whether to manage the chrony configuration. Default value: true.
# @param driftfile [Stdlib::Absolutepath] The path to the drift file to use. Default value: /var/lib/chrony/drift.
# @param keyfile [Stdlib::Absolutepath] Path to the keyfile used by chrony. Default value: varies by OS.
# @param package_ensure [String] What state to ensure the package is in. Values: 'present', 'latest', or a specific version. Default value: present.
# @param package_manage [Boolean] Whether or not Puppet should manage the state of the chrony package. Default value: true.
# @param package_name [String] What name to use for the chrony package. Default value: chrony.
# @param pool_use [Boolean] Whether or not to use a pool as the source to synchronize from. Default value: true.
# @param pool_address [String] What address to use for the server pool. Default value: pool.ntp.org.
# @param pool_maxservers [Integer[1]] How many servers to grab from the pool. Default value: 4.
# @param pool_iburst [Boolean] Whether or not to set the iburst option on the pool. Default value: true.
# @param servers [Array[String]] Array of servers to set as sources. Used only if pool_use is false. Default value: empty array.
# @param rtconutc [Boolean] Whether the RTC should be in UTC or in local time.
# @param service_enable [Boolean] Whether or not the service should be set to run on startup. Default value: true.
# @param service_ensure [String] What state to ensure the service is in. Default value: running.
# @param service_manage [Boolean] Whether to manage the chrony service. Default value: true.
# @param service_name [String] The name of chrony's service. Default value: varies by OS.
class chrony (
  Optional[String] $bindaddress,
  Boolean $client_allow,
  Optional[Array[String]] $client_sources,
  Stdlib::Absolutepath $config,
  String $config_file_mode,
  Boolean $config_manage,
  Stdlib::Absolutepath $driftfile,
  Stdlib::Absolutepath $keyfile,
  String $package_ensure,
  Boolean $package_manage,
  String $package_name,
  Boolean $pool_use,
  String $pool_address,
  Integer[1] $pool_maxservers,
  Boolean $pool_iburst,
  Array[String] $servers,
  Boolean $rtconutc,
  Boolean $service_enable,
  String $service_ensure,
  Boolean $service_manage,
  String $service_name,
) {
  contain 'chrony::package'
  contain 'chrony::config'
  contain 'chrony::service'

  Class['chrony::package']
  ->Class['chrony::config']
  ~>Class['chrony::service']
}
