#to update package
apt-get update
# to install nginx/sites-available/default
apt-get install nginx -y
# to install multiplesites
sudo mkdir -p /var/www/firstwebpage.com/html
sudo mkdir -p /var/www/secondwebpage.com/html
sudo mkdir -p /var/www/thirdwebpage.com/html
# to /var/www permission
sudo chmod -R 755 /var/www
# to copy index.html to mutilpe site custom root folder
cp server1.html /var/www/firstwebpage.com/html/index.html
cp server2.html /var/www/secondwebpage.com/html/index.html
cp server3.html /var/www/thirdwebpage.com/html/index.html

# createing virtual block for each website
cp firstwebpage.com /etc/nginx/sites-available/firstwebpage.com
cp secondwebpage.com /etc/nginx/sites-available/secondwebpage.com
cp thirdwebpage.com /etc/nginx/sites-available/thirdwebpage.com

# to enable vitual blocks
sudo ln -s /etc/nginx/sites-available/firstwebpage.com /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/secondwebpage.com /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/thirdwebpage.com /etc/nginx/sites-enabled/

cp /etc/nginx/nginx.conf /etc/nginx/nginxnginx.conf.orig
rm -rf /etc/nginx/nginx.conf
# upload new configuration
cp /home/ubuntu/nginx.conf /etc/nginx/nginx.conf

# to test sytax erors
sudo nginx -t

#to restart service
sudo systemctl restart nginx
