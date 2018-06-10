git pull origin master
cd digital_ocean
docker-compose down
docker-compose up -d --build
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