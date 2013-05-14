class turtles::master {

  service { 'pe-httpd':
    ensure  => running,
    enable => true,
  }
  
  Ini_setting {
    ensure  => present,
    notify  => Service['pe-httpd'],
    section => 'main',
    path    => '/etc/puppetlabs/puppet/puppet.conf',
  }

  File {
    ensure => file,
    owner  => 'pe-puppet',
    group  => 'pe-puppet',
  }

  ini_setting { 'main_modulepath':
    setting => 'modulepath',
    value   => '/etc/puppetlabs/puppet/environments/$environment/modules:/opt/puppet/share/puppet/modules',
  }

  ini_setting { 'main_manifestdir':
    setting => 'manifestdir',
    value   => '/etc/puppetlabs/puppet/environments/$environment/manifests',
  }

  ini_setting { 'main_config_version':
    setting => 'config_version',
    value   => '/etc/puppetlabs/puppet/config_version.sh $environment',
    require => File['/etc/puppetlabs/puppet/config_version.sh'],
  }

  file { '/etc/puppetlabs/puppet/autosign.conf':
    mode    => '0644',
    content => "*\n",
  }
  
  file { '/etc/puppetlabs/puppet/config_version.sh':
    mode   => '0755',
    source => 'puppet:///modules/turtles/config_version.sh',
  }

  file { '/etc/puppetlabs/puppet/modules':
    ensure => link,
    target => '/etc/puppetlabs/puppet/environments/production/modules',
    force  => true,
  }

  file { '/etc/puppetlabs/puppet/manifests':
    ensure => link,
    target => '/etc/puppetlabs/puppet/environments/production/manifests',
    force  => true,
  }
}
