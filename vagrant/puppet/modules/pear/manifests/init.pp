class pear{
	package { "php5-dev":
		ensure => present,
	}

	package { "php-pear":
		ensure => present,
		require => Package["php5-dev"]
	}
}