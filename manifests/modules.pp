class turtles::modules {
  # uses vcsrepo to ensure the right modules are installed from vcs

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/modules/profile/':
  	ensure   => present,
  	provider => git,
  	source   => 'git://github.com/puppetlabs-seteam/puppet-module-profile.git',
    revision => '8d9c28a4096105604a28009362965ab221c8a7d6',
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/modules/turtles/':
  	ensure => present,
  	provider => git,
  	source => 'git://github.com/mrzarquon/turtles.git',
  }

  vcsrepo { '/etc/puppetlabs/puppet/environments/production/modules/tomcat/':
  	ensure => present,
  	provider => git,
  	source => 'git://github.com/puppetlabs-seteam/puppet-module-tomcat.git',
  }
}
