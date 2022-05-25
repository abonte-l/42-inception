#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then

    echo "Wit DB"
    while ! mariadb -h$DB_HOST -P${MARIADB_PORT} -u$MARIADB_USR -p$MARIADB_PWD -e '\q'; do echo "DATABASE NOT READY YET"; sleep 2; done


    cd /var/www/html/
    
    echo "WP Core"
    wp core download --allow-root
    wp core config --dbname=${WP_DB_NAME} --dbuser=${MARIADB_USR} --dbpass=${MARIADB_PWD} --dbhost=${DB_HOST} --dbprefix=wp_ --allow-root
    wp core install --url="abonte-l.42.fr" --title="inception" --admin_user="botte" --admin_password="statue" --admin_email="bottestatue@caramail.com" --skip-email --allow-root
    wp theme install twentyseventeen --activate --allow-root

    wp user create yoda yoda@jedimaster.com --role=author --user_pass=grogu --allow-root
    wp post create --post_title="Do. Or do not" --post_content="There is no try." --post_status=publish --post_author="Yoda" --allow-root

    wp post create --post_type=page --post_title='About us' --post_status=publish --allow-root

    wp menu create "Primary Menu" --allow-root
    wp menu item add-post primary-menu 4 --title="About Us" --allow-root
    echo "End first_run"

fi

echo "Run php"
php-fpm7.3 --nodaemonize