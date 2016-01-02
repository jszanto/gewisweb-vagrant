class apache {

  # install apache
  package { "apache2":
    ensure => present,
    require => Exec["apt-get update"]
  }

  # ensures that mode_rewrite is loaded and modifies the default configuration file
  file { "/etc/apache2/mods-enabled/rewrite.load":
    ensure => link,
    target => "/etc/apache2/mods-available/rewrite.load",
    require => Package["apache2"]
  }

  # create directory
  file {"/etc/apache2/sites-enabled":
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    before => [
                File["/etc/apache2/sites-enabled/gewisweb.conf"],
                File["/etc/apache2/sites-enabled/pma.conf"]
              ],
    require => Package["apache2"],
  }

  # create apache config from main vagrant manifests
  file { "/etc/apache2/sites-available/gewisweb.conf":
    ensure => present,
    source => "/vagrant/puppet/manifests/gewisweb.conf",
    require => Package["apache2"],
  }

  # symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/gewisweb.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/gewisweb.conf",
    require => File["/etc/apache2/sites-available/gewisweb.conf"],
    notify => Service["apache2"],
  }

  # create apache config from main vagrant manifests
  file { "/etc/apache2/sites-available/pma.conf":
    ensure => present,
    source => "/vagrant/puppet/manifests/pma.conf",
    require => Package["apache2"],
  }

  # symlink apache site to the site-enabled directory
  file { "/etc/apache2/sites-enabled/pma.conf":
    ensure => link,
    target => "/etc/apache2/sites-available/pma.conf",
    require => File["/etc/apache2/sites-available/pma.conf"],
    notify => Service["apache2"],
  }

  # starts the apache2 service once the packages installed, and monitors changes to its configuration files and reloads if nesessary
  service { "apache2":
    ensure => running,
    require => Package["apache2"],
    subscribe => [
      File["/etc/apache2/mods-enabled/rewrite.load"],
      File["/etc/apache2/sites-available/gewisweb.conf"],
      File["/etc/apache2/sites-available/pma.conf"]
    ],
  }
}
