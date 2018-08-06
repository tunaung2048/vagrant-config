Update

echo "-- Install packages --"
#sudo apt-get install -y --force-yes apache2 mysql-server-5.6 git-core nodejs rabbitmq-server redis-server
sudo apt-get install -y --force-yes apache2 mysql-server-5.7  git-core nodejs rabbitmq-server redis-server
sudo apt-get install -y --force-yes php7.0-common php7.0-dev php7.0-json php7.0-opcache php7.0-cli libapache2-mod-php7.0 php7.0 php7.0-mysql php7.0-fpm php7.0-curl php7.0-gd php7.0-mcrypt php7.0-mbstring php7.0-bcmath php7.0-zip
# symfony 3 requirements php-xml(php-xml+php-dom)
sudo apt-get install -y --force-yes php7.0-simplexml php-xml

echo "-- Configure PHP &Apache --"
sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.0/apache2/php.ini
sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.0/apache2/php.ini
sudo a2enmod rewrite

echo "-- Creating virtual hosts --"
sudo ln -fs /vagrant/public/ /var/www/app

cat << EOF | sudo tee -a /etc/apache2/sites-available/default.conf
<Directory "/var/www/sites">
    AllowOverride All
</Directory>

<VirtualHost *:80>
    DocumentRoot /var/www/sites/symfony3
    ServerName sf3app.dev
</VirtualHost>

<VirtualHost *:80>
    DocumentRoot /var/www/phpmyadmin
    ServerName phpmyadmin.dev
</VirtualHost>
EOF
sudo a2ensite default.conf

echo "-- Restart Apache --"
sudo /etc/init.d/apache2 restart