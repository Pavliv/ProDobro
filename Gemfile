source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.0.0'
gem 'cancancan', '~> 2.0'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.4.3'
gem 'devise-i18n'
gem 'dotenv-rails'
gem 'haml', '~> 5.0.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3.1'
gem 'nokogiri'
gem 'premailer-rails'
gem 'rails', '~> 5.1.5'
gem 'rails-i18n', '~> 5.1'
gem 'rolify', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'faker', '1.8.7'
  gem 'jshint'
  gem 'mysql2', '>= 0.3.18', '< 0.5'
  gem 'puma', '~> 3.7'
  gem 'rspec-rails', '~> 3.7.0'
  gem 'rubocop-ci', git: 'https://github.com/ad2games/rubocop-ci'
  gem 'selenium-webdriver', '~> 3.11.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 2.0.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'pg', '~> 1.0.0'
  gem 'unicorn', '~> 5.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
