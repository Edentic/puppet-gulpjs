#GulpJS Puppet module
Puppet module for GulpJS

##Requirements
- [puppetlabs-nodejs](https://github.com/puppetlabs/puppetlabs-nodejs)

##Installation
Copy the module folder to your Puppet `modules` folder.

##Usage
GulpJS Puppet Package can be set up with the following parameters
```
class {'gulpjs':
      install_node => false, #Should the package install NodeJS?
      watch => false, #Should GulpJS start a watch task in /var/www directory
      require => Class['nodejs']
   }
```