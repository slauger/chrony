# @api private
# This class configures chrony. It should not be called on its own.
class chrony::config inherits chrony {
  file { 'chrony_config':
    ensure  => file,
    mode    => $chrony::config_file_mode,
    path    => $chrony::config,
    content => template('chrony/chrony.conf.erb'),
  }
}
