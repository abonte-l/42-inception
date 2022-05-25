# service mysql start

if [ ! -f /var/lib/mysql/first_run ]; then
    echo "Install"
	mysql_install_db

    echo "Run"
	/usr/bin/mysqld_safe &
	sleep 10s

    echo "Cmd"
	mysql -u root -e "CREATE DATABASE ${WP_DB_NAME};"

    mysql -u root -e "CREATE USER '${MYSQL_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT_USER}'@'%' WITH GRANT OPTION;"

    mysql -u root -e "CREATE USER '${MARIADB_USR}'@'%' IDENTIFIED BY '${MARIADB_PWD}';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${MARIADB_USR}'@'%' WITH GRANT OPTION;"
    mysql -u root -e "FLUSH PRIVILEGES;"
    
    echo "Kill"
    killall mysqld
	sleep 10s

    touch /var/lib/mysql/first_run
fi

echo "Final run"
/usr/bin/mysqld_safe