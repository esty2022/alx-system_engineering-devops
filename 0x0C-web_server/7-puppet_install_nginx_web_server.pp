# Script that installs and configures Nginx
exec {'update':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo apt-get -y update',
}

exec {'install':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo apt-get -y install nginx',
}

exec {'echo_html':
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'sudo echo "Hello World!" | sudo tee /var/www/html/index.html',
}

exec {'sed_config':
  command  => 'sudo sed -i "/server_name _;/ a\\\trewrite ^/redirect_me http://www.github.com/esty2022 permanent;" /etc/nginx/sites-enabled/default',
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
}

exec {'start':
  command  => 'sudo service nginx start',
  provider => shell,
  path     => '/usr/bin:/usr/sbin:/bin',
}
