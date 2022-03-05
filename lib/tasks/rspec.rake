desc "Runs rspec after cleaning the database"
task :rspec do
  ENV["RAILS_ENV"] = "test"
  system("bundle exec rake db:drop RAILS_ENV=test --quiet && bundle exec rake db:create RAILS_ENV=test --quiet && bundle exec rake db:migrate RAILS_ENV=test --quiet && bundle exec rake db:seed RAILS_ENV=test --quiet && #{ARGV.join(" ")}")
  ENV["RAILS_ENV"] = "development"
end
