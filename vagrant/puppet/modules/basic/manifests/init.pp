class basic{
	group{ "puppet" :
		ensure => present,
	}

	exec { "set_environments":
		notify => Service["mysql"],
		command => "echo LC_ALL='en_US.UTF-8' >> /etc/environment",
		require => Package["mysql-server"],
		onlyif => "grep -c '^LC_ALL' /etc/environment | grep 0",
	}
}