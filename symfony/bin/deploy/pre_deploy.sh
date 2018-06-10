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
docker exec container_phpfpm bin/console doctrine:database:create
docker exec container_phpfpm bin/console doctrine:migrations:migrate --no-interaction
