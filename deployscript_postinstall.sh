bundle install
rake db:drop
rake db:migrate
rails server -d
rails restart