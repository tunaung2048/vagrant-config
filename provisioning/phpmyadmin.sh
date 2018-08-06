echo "-- Install phpMyAdmin --"
wget -k https://files.phpmyadmin.net/phpMyAdmin/4.7.4/phpMyAdmin-4.7.4-english.tar.gz
sudo tar -xzvf phpMyAdmin-4.7.4-english.tar.gz -C /var/www/
sudo rm phpMyAdmin-4.7.4-english.tar.gz
sudo mv /var/www/phpMyAdmin-4.7.4-english/ /var/www/phpmyadmin
# wget -k https://files.phpmyadmin.net/phpMyAdmin/4.0.10.11/phpMyAdmin-4.0.10.11-english.tar.gz
#sudo tar -xzvf phpMyAdmin-4.0.10.11-english.tar.gz -C /var/www/
# sudo rm phpMyAdmin-4.0.10.11-english.tar.gz
# sudo mv /var/www/phpMyAdmin-4.0.10.11-english/ /var/www/phpmyadmin

echo "-- Restart Apache --"
sudo /etc/init.d/apache2 restart