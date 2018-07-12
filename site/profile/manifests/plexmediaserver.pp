# parameterized install
class { 'plexmediaserver':
  plex_user                                 => 'systems',
  plex_media_server_home                    => '/var/lib/plexmediaserver',
  plex_media_server_application_support_dir => "/var/lib/plexmediaserver/Library/Application\ Support",
  plex_media_server_max_plugin_procs        => '7',
  plex_media_server_max_stack_size          => '20000',
  plex_media_server_max_lock_mem            => '4000',
  plex_media_server_max_open_files          => '1024',
  plex_media_server_tmpdir                  => '/var/tmp',
}
