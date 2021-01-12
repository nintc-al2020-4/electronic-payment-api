docker-compose build

docker-compose run -e RAILS_ENV=development --rm app bundle install
docker-compose run -e RAILS_ENV=development --rm app bundle exec rake db:create ridgepole:apply db:seed db:seed_fu
