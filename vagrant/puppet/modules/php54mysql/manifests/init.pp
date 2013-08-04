class php54mysql{
	package { "php5-mysql":
		ensure => present,
		require => Package["mysql-server"]
	}
}