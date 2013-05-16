class turtles::params {
  
  $list_of_users = pick($::list_of_users,hiera('users_list','nil'))
  $rootpw = pick($::rootpw,hiera('rootpw','$1$f6lfMB7w$JkbGbJQ/mRmbN9FMSonYl1')) 
  

}
