# this module makes configuration changes to the master so it can accept autosign connections from agents
# and other tasks to help automate the building of systems

class turtles::master (
  $master_fqdn = "puppet.smf.company.lan",
  $region_regex = "*.smf.company.lan",
) {

  include turtles::modules

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
    content => "*.smf.company.lan\n*.aus.company.lan\n",
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
  
  file {'/etc/puppetlabs/puppet/hiera.yaml':
    ensure => file,
    source => 'puppet:///modules/turtles/hiera.yaml',
    mode   => 0755,
  }


  #this enables the puppet master to serve out agent kickstarts
  file {'/etc/puppetlabs/httpd/conf.d/enable_port80.conf':
    ensure  => file,
    source  => 'puppet:///modules/turtles/enable_port80.conf',
    mode    => 0755,
    require => File['/opt/pe_autoinstall/html'],
    notify  => Service['pe-httpd'],
  }

  exec {'relocate_installer':
    command     => "/bin/mv /opt/pe_autoinstall/puppet-enterprise-2.8.1-el-6-x86_64.tar.gz /opt/puppet/var/www/html/puppet-enterprise-2.8.1-el-6-x86_64.tar.gz",
    creates => "/opt/puppet/var/www/html/puppet-enterprise-2.8.1-el-6-x86_64.tar.gz",
    require => File['/opt/pe_autoinstall/html'],
  }

  #this should be updated to include the kickstart template class

}
