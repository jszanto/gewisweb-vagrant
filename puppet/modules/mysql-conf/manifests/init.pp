class mysql-conf {
  
  class { '::mysql::server':
      root_password           => 'password',
  }

  mysql::db { 'database':
      user     => 'username',
      password => 'password'
  }
}
