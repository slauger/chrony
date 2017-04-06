# @api private
# This class configures the chrony service. It should not be called on its own.
class chrony::service inherits chrony {
  if $chrony::service_manage == true {
    service { 'chrony':
      ensure => $chrony::service_ensure,
      enable => $chrony::service_enable,
      name   => $chrony::service_name,
    }
  }
}
