# @api private
# This class installs chrony. It should not be called on its own.
class chrony::install inherits chrony {
  if $chrony::package_manage == true {
    package { 'chrony':
      ensure => $chrony::package_ensure,
      name   => $chrony::package_name,
    }
  }
}
