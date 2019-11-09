# @api private
# This class configures chrony. It should not be called on its own.
class chrony::config {
  if ($chrony::config_manage == true) {
    file { $chrony::config:
      ensure  => file,
      mode    => $chrony::config_file_mode,
      content => epp("${module_name}/chrony.conf.epp"),
    }
  }
}
