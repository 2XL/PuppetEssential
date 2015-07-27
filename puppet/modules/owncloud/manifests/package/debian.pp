class owncloud::package::debian() {

  apt::source { 'owncloud':
    location => "http://download.opensuse.org/repositories/isv:/ownCloud:/community/Debian_${::operatingsystemmajrelease}.0/",
    release  => ' ',
    repos    => '/',
    key      => {
      keys.gid     => 'F9EA4996747310AE79474F44977C43A8BA684223',
      source => "http://download.opensuse.org/repositories/isv:/ownCloud:/community/Debian_${::operatingsystemmajrelease}.0/Release.key",
    },
    before   => Package[$::owncloud::package_name],
  }->
  file {
    '/tmp/thescript':
      ensure => file,
      mode => '0775',
      source => 'puppet:///modules/owncloud/installClient.sh'
  }->
  exec {
    'install owncloud-client':
      command => '/tmp/thescript',
      path    => ['/bin','/usr/bin'],
      onlyif  => '/tmp/thescript',
      require => File['/tmp/thescript']
  }
/*
install the client and fix the key ring
todo: launch a cron with 30s delay interval
*/


}