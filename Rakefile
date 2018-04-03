ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :drop! do
  File.delete("./db/development.sqlite") and File.delete("./db/schema.rb")
  Rake::Task['db:migrate'].reenable
  Rake::Task['db:migrate'].invoke

  # destroy your model instances, replace below with your classes
  User.destroy_all
  Entry.destroy_all
  Goal.destroy_all
end