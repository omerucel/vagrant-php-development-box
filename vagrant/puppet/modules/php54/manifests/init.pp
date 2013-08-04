class php54 {
	package { ["php5", "php5-cli", "php-apc"]:
		ensure => present,
	}
}