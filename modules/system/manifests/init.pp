class system (
  $base_packages = hiera_array( 'base_packages', [ 'wget', 'htop', 'screen', 'git', 'vim', 'lsof', 'bind9-host' ] )
) {

#notify { $base_packages : }

  package { $base_packages:
    ensure => 'latest',
  }

# Files that update /etc/issue with the IP address to be shown on boot

  file { '/etc/issue-standard' :
    ensure => 'file',
    source => 'puppet:///modules/system/issue-standard',
  }

  file { '/etc/network/if-up.d/show-ip-address' :
    ensure => 'file',
    source => 'puppet:///modules/system/show-ip-address',
  }

}
