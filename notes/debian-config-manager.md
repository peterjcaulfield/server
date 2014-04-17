#### Using debian configuration management to preset install values

First to get options that you need to set e.g if you want all the options for mysql packages during install:

```
sudo debconf-get-selections | grep mysql
```

#### Setting a package config value

```
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password secret'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password secret'
sudo apt-get -y install mysql-server
```

