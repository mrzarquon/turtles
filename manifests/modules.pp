class turtles::modules {
  # uses vcsrepo to ensure the right modules are installed from vcs

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/profile/':
  	ensure   => present,
  	provider => git,
  	source   => 'git://github.com/puppetlabs-seteam/puppet-module-profile.git'
    revision => '89e66c1b11284603457ea31088ace2169532d12b',
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/turtles/':
  	ensure => latest,
  	provider => git,
  	source => 'git://github.com/mrzarquon/turtles.git',
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/tomcat/':
  	ensure => present,
  	provider => git,
  	source => 'git://github.com/puppetlabs-seteam/puppet-module-tomcat.git',
  }
}
