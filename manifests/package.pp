# @api private
# This class installs chrony. It should not be called on its own.
class chrony::package {
  if ($chrony::package_manage == true) {
    package { $chrony::package_name:
      ensure => $chrony::package_ensure,
    }
  }
}
