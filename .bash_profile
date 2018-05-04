function vhost {
# Check if the virtualhost folder name already exists
if [ -d "/Applications/XAMPP/xamppfiles/htdocs/$1" ]; then
  echo "\"$1\" already exists, VirtualHost will not be created"
  return
fi

# Define the default domain (without period)
vhdomain=local

# If you set -D option, the next word fill be used as domain
if [ "$2" = "-D" ]; then
  vhdomain="$3"
fi

# Create directory inside htdocs
sudo mkdir /Applications/XAMPP/xamppfiles/htdocs/$1

# Set current user as folder owner
sudo chown -R $USER:admin /Applications/XAMPP/xamppfiles/htdocs/$1

# Add the VirtualHost configuration in the config file
    echo "
<VirtualHost $1.$vhdomain:80>
    ServerName $1.$vhdomain
    ServerAlias $1.$vhdomain
    DocumentRoot \"/Applications/XAMPP/xamppfiles/htdocs/$1/\"
    <Directory \"/Applications/XAMPP/xamppfiles/htdocs/$1/\">
        Options All
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog \"logs/$1.$vhdomain-error.log\"
</VirtualHost>" >> /Applications/XAMPP/xamppfiles/etc/extra/httpd-vhosts.conf

# Add the local host in the system's hosts file
echo "127.0.0.1 $1.$vhdomain" | sudo tee -a /private/etc/hosts > /dev/null

# Display success message
echo "> VirtualHost successfully created!"

# Restart Apache if it was asked
if [ "$4" = "-ra" ] || [ "$2" = "-ra" ]; then
 sudo /Applications/XAMPP/xamppfiles/xampp reloadapache > /dev/null
 echo "> Apache has been restarted successfully!"
fi

echo "> You can access it through \"http://$1.$vhdomain\""

# End
return
}
