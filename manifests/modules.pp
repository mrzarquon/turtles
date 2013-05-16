class turtles::modules {
  # uses vcsrepo to ensure the right modules are installed from vcs

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/profile/':
  	ensure   => present,
  	provider => git,
  	source   => 'git://github.com/puppetlabs-seteam/puppet-module-profile.git',
    revision => '5bc24b1764f66bbb6a24fd1ae5be7b345c504f76',
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/turtles/':
  	ensure => present,
  	provider => git,
  	source => 'git://github.com/mrzarquon/turtles.git',
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/tomcat/':
  	ensure => present,
  	provider => git,
  	source => 'git://github.com/puppetlabs-seteam/puppet-module-tomcat.git',
  }
}
