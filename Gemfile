source 'https://rubygems.org'

# git_source(:github) do |repo_name|
#   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
#   "https://github.com/#{repo_name}.git"
# end
ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Bootstrap for Sass
gem 'bootstrap-sass', '~> 3.3.6'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# HTML Abstraction Markup Language
gem 'haml-rails'

# Authentication solution
gem 'devise'

# For pagination
gem 'kaminari'

gem 'font-awesome-rails'

# Decorators/View-Models
gem 'draper', '3.0.0.pre1'

# Development
group :development do
  gem 'web-console'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'hirb' # Mini view framework for console applications
  gem 'letter_opener' # Preview email in the browser instead of sending it
  gem 'bullet' # Help to kill N+1 queries and unused eager loading
  gem 'railroady', require: false # rake diagram:all
  gem 'spring' # Rails application preloader
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print', '~> 1.6', '>= 1.6.1' # Pretty prints Ruby objects
  gem 'pry-rails' # Best Console handler
  gem 'pry-doc' # show doc on offline in console Ex: type '? Array#each'
  gem 'rails_db' # Rails Database Viewer and SQL Query Runner. run 'railsdb'

  gem 'brakeman', require: false # <<brakeman>>
  gem 'annotate' # Add a comment summarizing the current schema
  # Performance
  gem 'rack-mini-profiler' # Inline app profiler. See ?pp=help for options.
  # gem 'flamegraph'         # Flamegraph visualiztion: ?pp=flamegraph

  # Refactoring and code quality
  gem 'reek', require: false # code smell <<reek app/>>. USE 'rubycritic'
  gem 'rails_best_practices' # <<rails_best_practices -f html app/presenters/>>
end

# Unit testing related gems
group :test do
  gem 'test-unit'
  gem 'rspec-rails'
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda', '=3.5.0'
  gem 'shoulda-matchers'
end

group :test, :development do
  gem 'byebug', platform: :mri
  gem 'dotenv-rails'
  gem 'faker'
  gem 'foreman'
end
