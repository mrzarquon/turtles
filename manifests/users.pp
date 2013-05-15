class turtles::users {

  $list_of_users = hiera('users_list')

  create_resources('pe_accounts::user', $list_of_users)

  user { 'root':
    ensure   => present,
    password => '$1$f6lfMB7w$JkbGbJQ/mRmbN9FMSonYl1',
    shell    => '/bin/bash',
  }

  ssh_authorized_key { 'cbarker':
    ensure  => present,
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDiuh3j8KLFJIR/39956ZhilKtMTr7ivm9e6K4/pzU2Cqvg4pBeXPGglbJqz6TNnD+IL9PJefFwmNlxpim8ARY+h2zXN25SLhZzoM3/wPqt9Q5+r0ylpdlXGLCilMl7m2OfBPhvNDm5DJSCQ9XwRvt0K66DvZ6A/43jchtt6xFC7N9ZHCLXPFTeaEO19IyjGFtlS0eLpKRn9oVKAzwPOTKyuWD5aveHTlI0UqqZnY/aWvcq6mA8yymmbxOm9AkXaAyMoirdoH+7pHuMWPUw0keQzBfwHsXbeRP+G4I0QyTUJgqioXFU1bn4oDaprU1BP23F+agBedriewtiNewSqJWJ',
    type    => 'ssh-rsa',
    name    => 'cbarker@puppetlabs.com',
    user    => 'root',
    require => User['root'],
  }
}
