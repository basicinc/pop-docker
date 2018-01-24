docker-compose up -d
cd ../pops
bundle exec sidekiq -d -P tmp/sidekiq.pid -L log/sidekiq.log
# bundle exec puma -b 'ssl://0.0.0.0:3000?key=/private/etc/ssl/private/homeup.key&cert=/private/etc/ssl/certs/homeup.crt'
bundle exec rails s
bundle exec sidekiqctl stop tmp/sidekiq.pid 0
cd ../pops-dev
docker-compose stop
