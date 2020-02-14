class profile::repo {

  cron { 'repo_sync':
    command     => '/net/systems/bin/centos_mirror_repo.sh',
    hour        => '2-4',
    monthday    => '1',
    user        => 'root',
  }
}
