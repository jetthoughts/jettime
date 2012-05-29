require 'heroku_subdomain'

HerokuSubdomain.configure do |config|
  config.heroku_api_key = '197c9196f0c294ceea9c8720b7dc5772' || ENV['HEROKU_API_KEY']
  config.addons = ["memcache:5mb", "mongolab:starter", "redistogo:nano", "sendgrid:starter"]
  config.vars = [{
                     MONGOLAB_URI: "mongodb://heroku_app811889:h6v9tdh2pmel8pgevu3uj6guo8@dbh42.mongolab.com:27427/heroku_app811889"

                 }]
end