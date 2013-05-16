class turtles::modules {
  # uses vcsrepo to ensure the right modules are installed from vcs

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/profile/':
  	ensure => latest,
  	provider => git,
  	source => 'git://github.com/puppetlabs-seteam/puppet-module-profile.git'
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/turtles/':
  	ensure => latest,
  	provider => git,
  	source => 'git://github.com/mrzarquon/turtles.git',
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/tomcat/':
  	ensure => latest,
  	provider => git,
  	source => 'git://github.com/puppetlabs-seteam/puppet-module-tomcat.git',
  }
}
