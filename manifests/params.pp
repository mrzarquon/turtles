class turtles::params {
  
  $list_of_users = hiera_hash('users_list','nil')
  $rootpw = hiera('rootpw','$1$f6lfMB7w$JkbGbJQ/mRmbN9FMSonYl1') 
  

}
