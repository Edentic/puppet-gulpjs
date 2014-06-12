# Class: gulpjs
#
# This module installs GulpJS
#
# Parameters:
#
# Actions:
#
# Requires:
#   puppetlabs/nodejs https://github.com/puppetlabs/puppetlabs-nodejs
# Sample Usage:
#   include gulpjs
#
#   class {'gulpjs':
#      install_node => false, #Should the package install NodeJS?
#      watch => false, #Should GulpJS start a watch task in /var/www directory
#      require => Class['nodejs']
#   }

class gulpjs ($install_node = true, $watch = false) {

  if($install_node == true) {
    class {'nodejs' :
      manage_repo => true,
      version => 'latest'
    }
  }

  package { 'gulp':
    ensure   => present,
    provider => 'npm',
    require => Class['nodejs']
  }

  nodejs::npm { '/var/www:gulp':
    ensure  => present,
    install_opt => '--save-dev',
    require => Package['gulp']
  }

  if($watch == true) {
      exec {'nohup gulp watch 0<&- &>/dev/null &':
        cwd => '/var/www',
        require => Nodejs::Npm['/var/www:gulp'],
        user => 'vagrant'
      }
  }
}