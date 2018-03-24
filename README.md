# chrony

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with chrony](#setup)
    * [Beginning with chrony](#beginning-with-chrony)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Module to install, configure, and manage the chrony service for Linux. Tested on
Puppet 4.9 and 4.10, should work with older 4.x versions as well.

## Setup

### Beginning with chrony

Simply include the module to install chrony with all its defaults:

```
include chrony
```

## Usage

To specify a different pool address (rather than the default distro.pool.ntp.org
format):

```
class { 'chrony':
  pool_address => 'pool.ntp.org',
}
```

To specify a list of servers rather than a pool:

```
class { 'chrony':
  pool_use => false,
  servers => ['0.pool.ntp.org','1.pool.ntp.org','2.pool.ntp.org','3.pool.ntp.org'],
}
```

To allow clients to query your system for NTP (blocked by default):

```
class { 'chrony':
  client_allow => true,
  client_sources => [
    'somehostname',
    '192.168.0.0/24',
    'fd00::/8',
  ],
}
```

## Reference

### chrony

This is the main class, and the only one that should be used. It calls the other
classes in turn to install and configure chrony.

#### Parameters

All parameters optional unless otherwise specified.

**bindaddress**: String, a specific address to listen for NTP requests. 
**client_allow**: Boolean, sets whether or not to allow clients to connect.  
**client_sources**: Array[String], a list of hostnames or IP networks allowed to connect.
Required if client_allow is set to true.  
**config**: String, specifies the location of the config file.  
**config_file_mode**: String, specifies the access mode to set on the config file.  
**driftfile**: String, specifies the location for the driftfile.  
**keyfile**: String, specifies path to the keyfile used to authenticate access to chrony.  
**package_ensure**: String, sets the "ensure" parameter on the package resource for chrony.  
**package_manage**: Boolean, sets whether or not Puppet will manage the chrony package.  
**package_name**: String, specifies the name of the chrony package.  
**pool_use**: Boolean, sets whether or not to use a "pool" directive in chrony.conf.  
**pool_address**: String, the address of the NTP pool to use.  
**pool_maxservers**: Integer, the number of sources to pull from the pool.  
**pool_iburst**: Boolean, specifies whether or not to set the iburst on the pool.  
**servers**: Array[String], specifies the list of servers to sync time from.
Required if pool_use is set to false.  
**service_enable**: Boolean, whether to enable the chrony service to run at startup.  
**service_ensure**: String, sets the "ensure" parameter on the service resource for chrony.  
**service_manage**: Boolean, whether or not Puppet should manage the chrony service.  
**service_name**: String, the name of the chrony service.  

### chrony::install

Installs the chrony package.

### chrony::config

Builds chrony.conf based on the parameters passed into the base class.

### chrony::service

Manages the chrony service.

## Limitations

Tested on Puppet 4.9 and 4.10, and the following Linux releases:

CentOS 6.9, 7.3  
RHEL 7.3
Debian 7.11, 8.7  
Ubuntu 12.04, 14.04, 16.04  

Other Puppet 4.x versions should work, as nothing fancy is going on in the code here.
Other Linux distros and versions may work, but no guarantees.
