define monit::config($content = false, $source = false) {
    $filename = "/etc/monit/monitrc.d/${name}.rc"

    if $source {
        file { $filename:
            ensure  => present,
            source  => $source,
            owner   => root,
            group   => root,
            mode    => 600,
            notify  => Service["monit"],
            require => Package["monit"],
        }
    } else {
        if $content {
            file { $filename:
                ensure  => present,
                content => $content,
                owner   => root,
                group   => root,
                mode    => 600,
                notify  => Service["monit"],
                require => Package["monit"],
            }
        } else {
            file { $filename:
                ensure  => present,
                owner   => root,
                group   => root,
                mode    => 600,
                notify  => Service["monit"],
                require => Package["monit"],
            }
        }
    }
}
