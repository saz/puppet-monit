class monit {
    require monit::params

    $monit_interval = $monit::params::interval
    $monit_mailserver = $monit::params::mailserver
    $monit_alert = $monit::params::alert
    $monit_httpserver = $monit::params::httpserver
    $monit_httpauth = $monit::params::httpauth

    package { "monit":
        ensure => present
    }

    service { "monit":
        ensure  => running,
        require => [ Package["monit"], File["monitrc.d"], Monit::Config["global"] ],
    }

    file { "monit-default":
        ensure  => present,
        path    => "/etc/default/monit",
        content  => template("monit/monit.default.erb"),
        require => Package["monit"],
    }

    file { "monitrc":
        ensure  => present,
        path    => "/etc/monit/monitrc",
        source  => "puppet:///monit/monitrc",
        owner   => root,
        group   => root,
        mode    => 600,
        require => Package["monit"],
    }

    file { "monitrc.d":
        ensure  => directory,
        path    => "/etc/monit/monitrc.d",
        owner   => root,
        group   => root,
        mode    => 700,
        recurse => true,
        purge   => true,
        require => Package["monit"],
    }

    monit::config{ "global":
        content => template("monit/global.rc.erb"),
    }
}
