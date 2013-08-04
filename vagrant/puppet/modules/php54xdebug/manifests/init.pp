class php54xdebug{
	package { "php5-xdebug":
		ensure => present,
		require => Package["php5"]
	}

	file { "/etc/php5/conf.d/20-xdebug.ini":
		ensure => present,
		owner => root, group => root,
		source => "/vagrant/vagrant/puppet/files/20-xdebug.ini",
		require => Package["php5-xdebug"]
	}

	exec { "create_tmp_xdebug":
		command => "mkdir -p /vagrant/tmp/xdebug",
		creates => "/vagrant/tmp/xdebug",
		require => Package["php5-xdebug"]
	}
}