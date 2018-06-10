git pull origin master
cd digital_ocean
docker-compose down
docker-compose up -d --build
docker exec container_phpfpm composer install -n --prefer-dist
docker exec container_phpfpm bin/console cache:clear --env=prod --no-interaction
docker exec container_phpfpm bin/console cache:warmup --env=prod --no-interaction
docker exec container_phpfpm yarn config set ignore-engines true
docker exec container_phpfpm yarn install
docker exec container_phpfpm yarn run encore production
docker exec -e DATABASE_URL=$DATABASE_URL  container_phpfpm bin/console doctrine:migrations:migrate --no-interaction




# env variable
SYMFONY_APP_PATH=$SYMFONY_APP_PATH

# PHP/nginx
TIMEZONE=$TIMEZONE
MAX_EXECUTION_TIME=$MAX_EXECUTION_TIME

# MySQL
MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD
MYSQL_DATABASE=$MYSQL_DATABASE
MYSQL_USER=$MYSQL_USER
MYSQL_PASSWORD=$MYSQL_PASSWORD

# RabbitMQ
RABBITMQ_USER=rabbit
RABBITMQ_PASSWORD=mq

# prod
DATABASE_URL=$DATABASE_URL
APP_ENV=$APP_ENV