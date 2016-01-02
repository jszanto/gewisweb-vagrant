class misc {

  # package install list
  $packages = [
    "curl",
    "vim",
    "htop",
    "git",
    "ruby",
    "nodejs",
    "npm"
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }
}
