class turtles::users (
  $rootpw = $turtles::params,
  $list_of_users = $turtles::list_of_users
) inherits turtles::params {

  create_resources('pe_accounts::user', $list_of_users)

  resources { 'user':
    purge => true,
  }
  
  user { 'root':
    ensure   => present,
    password => '$1$f6lfMB7w$JkbGbJQ/mRmbN9FMSonYl1',
    shell    => '/bin/bash',
  }
}
