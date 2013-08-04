class apache{
	package { "apache2":
		ensure => present,
	}

	service { "apache2":
	    enable => true,
		ensure => running,
		require => Package["apache2"],
		subscribe => [
			File["/etc/apache2/mods-enabled/rewrite.load"],
			File["/etc/apache2/sites-available/default"],
			File["/etc/php5/conf.d/20-xhprof.ini"],
			File["/etc/php5/conf.d/20-xdebug.ini"],
			Package["php5-curl"],
			Package["php5-mysql"],
			Exec["set_servername"]
		]
	}

	file { "/etc/apache2/mods-enabled/rewrite.load":
		ensure => link,
		target => "/etc/apache2/mods-available/rewrite.load",
		require => Package["apache2"]
	}

	file { "/etc/apache2/sites-available/default":
		ensure => present,
		owner => root, group => root,
		source => "/vagrant/vagrant/puppet/files/vhost",
		require => Package["apache2"]
	}

	exec { "set_servername":
		command => 'echo "ServerName localhost" | sudo tee /etc/apache2/conf.d/fqdn',
		require => Package["apache2"]
	}
}