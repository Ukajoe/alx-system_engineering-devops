# This puppet manifest replaces a type in a wordpress config file and restarts

file { '/var/www/html/wp-settings.php':

  ensure => present,

}

-> exec { 'sed file':

  command => 'sed -i \'s/class-wp-locale.phpp/class-wp-locale.php/\' wp-settings.php; apache2ctl restart',

  cwd     => '/var/www/html',

  path    => ['/bin/', '/usr/sbin/'],

}
