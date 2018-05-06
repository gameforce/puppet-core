class profile::gitlab {

  class { 'gitlab':
    external_url => 'http://vip.gameforce.net/gitlab',
  }
}
