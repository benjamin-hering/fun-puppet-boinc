include system

node default {
  #   class { 'my_class': }
  notify { "Hello ${fqdn}": }
}
