class profile::transmission {
    class {'transmission':
       download_dir   => "/data/systems/downloads",
       incomplete_dir => "/data/systems/downloads/incomplete",
       web_port       => 9091,
       web_whitelist  => ['127.0.0.1'],
       blocklist_url  => 'http://list.iblocklist.com/?list=bt_level1',
       web_user       => 'transmission',
       web_password   => '#thx1138',
    }
}
