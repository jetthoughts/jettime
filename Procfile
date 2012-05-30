web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
mongodb: mongod --config /usr/local/Cellar/mongodb/2.0.1-x86_64/mongod.conf --fork --quiet --nohttpinterface --profile 0
worker:  bundle exec rake resque:work QUEUE=*
clock:     bundle exec resque-scheduler
