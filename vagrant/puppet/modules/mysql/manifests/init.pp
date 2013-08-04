class mysql{
	$grantSql = 'GRANT ALL ON *.* TO root@"%" IDENTIFIED BY "" WITH GRANT OPTION;'

	package { "mysql-server":
		ensure => present,
	}

	service { "mysql":
	    enable => true,
		ensure => running,
		require => Package["mysql-server"],
	}

	exec { "comment_bind_address":
		notify => Service["mysql"],
		command => "replace 'bind-address' '#bind-address' -- /etc/mysql/my.cnf",
		require => Package["mysql-server"],
		onlyif => "grep -c '^bind-address' /etc/mysql/my.cnf",
	}

	exec { "grant_all":
		command => "mysql -uroot -e '$grantSql'",
		require => Exec["comment_bind_address"]
	}
}