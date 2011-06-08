class monit::params {
    $interval = $monit_interval ? {
        ''      => "120",
        default => $monit_interval,
    }

    $mailserver = $monit_mailserver ? {
        ''      => "localhost",
        default => $monit_mailserver,
    }

    $alert = $monit_alert ? {
        ''      => "root@localhost",
        default => $monit_alert,
    }

    $httpserver = $monit_httpserver ? {
        yes     => "yes",
        no      => "no",
        default => "no",
    }

    $httpauth = $monit_httpauth ? {
        ''      => "admin:monit",
        default => $monit_httpauth,
    }

    $httpport = $monit_httpport ? {
        ''      => "2812",
        default => $monit_httpport,
    }
}
