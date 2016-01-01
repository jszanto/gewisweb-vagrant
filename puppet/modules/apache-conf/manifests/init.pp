class apache-conf {

  class { 'apache':
    default_vhost => false,
  }
  
  apache::vhost { 'gewisweb.dev':
    port          => '80',
    docroot       => '/var/www/gewisweb/public',
    docroot_owner => 'vagrant',
    docroot_group => 'www-data',
    setenv => ['APP_ENV development']
  }
}
