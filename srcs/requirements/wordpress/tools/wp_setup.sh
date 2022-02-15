#!/bin/sh

while ! mariadb -h$MARIADB_HOST -P${MARIADB_PORT} -u$MARIADB_USR -p$MARIADB_PWD; do echo "DATABASE NOT READY YET"; done

wp core install --url="abonte-l.42.fr" --title="inception" --admin_user="botte" --admin_password="statue" --admin_email="bottestatue@caramail.com" --skip-email

wp theme install twentyseventeen --activate

wp user create yoda yoda@jedimaster.com --role=author --user_pass=grogu
wp post create --post_title="Do. Or do not" --post_content="There is no try." --post_status=publish --post_author="Yoda"

wp post create --post_type=page --post_title='About us' --post_status=publish 

wp menu create "Primary Menu"
wp menu item add-post primary-menu 4 --title="About Us"
