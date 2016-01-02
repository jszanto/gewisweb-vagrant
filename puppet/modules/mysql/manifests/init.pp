class mysql {
	package { ['mysql-server']:
		ensure => present;
	}

	service { 'mysql':
		ensure  => running,
		require => Package['mysql-server'];
	}

	exec { 'set-mysql-password':
		unless  => 'mysqladmin -uroot -ppassword status',
		command => "mysqladmin -uroot password password",
		path    => ['/bin', '/usr/bin'],
		require => Service['mysql'];
	}

    exec { 'create-mysql-database':
		command => "mysqladmin -uroot -ppassword create database",
		path    => ['/bin', '/usr/bin'],
		require => Exec['set-mysql-password'];
	}
}
