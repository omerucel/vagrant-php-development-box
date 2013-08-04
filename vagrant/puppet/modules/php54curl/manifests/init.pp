class php54curl{
	package { "php5-curl":
		ensure => present,
		require => Package["php5"]
	}
}