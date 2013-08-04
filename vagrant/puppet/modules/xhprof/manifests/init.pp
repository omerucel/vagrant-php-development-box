class xhprof{
	exec { "install_xhprof":
		command => "pecl install xhprof-0.9.3",
		require => Package["php-pear"],
		onlyif => "[ ! -f /etc/php5/conf.d/20-xhprof.ini ]"
	}

	file { "/etc/php5/conf.d/20-xhprof.ini":
		ensure => present,
		owner => root, group => root,
		source => "/vagrant/vagrant/puppet/files/20-xhprof.ini",
		require => Exec["install_xhprof"]
	}

	exec { "create_tmp_xhprof":
		command => "mkdir -p /vagrant/tmp/xhprof",
		creates => "/vagrant/tmp/xhprof",
		require => Exec["install_xhprof"]
	}
}