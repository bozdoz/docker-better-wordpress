# docker-better-wordpress

Configure WordPress SMTP Mail and Uploads

### Usage

#### docker-compose.yml

```yml
version: '3.4'

services:
  mysql:
    image: mariadb
    volumes:
      - db_volume:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD:-whocares}

  wordpress:
    image: bozdoz/better-wordpress
    env_file: .env
    depends_on:
      - mysql
    volumes:
      - wp_volume:/var/www/html
    ports:
      - ${WP_PORT:-1234}:80
    restart: always
    environment:
      WORDPRESS_DB_PASSWORD: ${MYSQL_ROOT_PASSWORD:-whocares}
  
volumes:
  db_volume:
  wp_volume:
```

#### .env

```bash
WP_PORT=8080

MAIL_HOST=smtp.mailgun.org
MAIL_USER=user@mail.domain.com
MAIL_PASS=58314b17c4e9ccc017b140969-0bc8f519-345fa13b
```

## But Why

This will auto-configure working email and uploads.
