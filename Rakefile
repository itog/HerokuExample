require 'dm-core'
require 'dm-migrations'
require './model.rb'
 
task 'db:migrate' do
  DataMapper::setup(:default, ENV['DATABASE_URL'] || 'sqlite3:./db/db.sqlite3')
  DataMapper.auto_upgrade!
  self
end
