#
# memcached module
#
# Copyright 2010, Atizo AG
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class memcached {
  package{'memcached':
    ensure => present,
  }
  service{'memcached':
    ensure => running,
    enable => true,
    hasstatus => true,
    require => Package['memcached'],
  }
  file{'/etc/sysconfig/memcached':
      source =>  [
        "puppet://$server/modules/site-memcached/memcached.sysconfig",
        "puppet://$server/modules/nginx/memcached.sysconfig",
      ],
      notify => Service['memcached'],
      owner => root, group => root, mode => 0444;
  }
}
