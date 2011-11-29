require "rubygems"
require "sinatra"
require "dm-core"
require "haml"
require 'dm-migrations'
require 'json'
require 'dm-serializer'
require 'pp'

require './model.rb'

DataMapper::setup(:default, ENV['DATABASE_URL'] || 'sqlite3:./db/db.sqlite3')
DataMapper.finalize

def insert
  foo = Foo.create()  
  bar = Bar.create()

  foo.bar = build
  foo.save
end


get '/' do
  Foo.all().to_json
end

get '/add' do
  begin
    insert()
  rescue => e
    p e
  end
  "added new entry"
end
