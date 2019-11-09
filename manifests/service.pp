# @api private
# This class configures the chrony service. It should not be called on its own.
class chrony::service {
  if ($chrony::service_manage == true) {
    service { $chrony::service_name:
      ensure => $chrony::service_ensure,
      enable => $chrony::service_enable,
    }
  }
}
