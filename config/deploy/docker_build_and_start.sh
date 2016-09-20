cd docker-rails-school-complete

echo "building images..."

docker-compose build

echo "starting containers..."

docker-compose up -d