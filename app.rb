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
  device = DeviceInfo.create()  
  build = BuildInfo.create(:VERSION_d_SDK => "hoge")

  device.buildInfo = build
  device.save
end


get '/' do
  DeviceInfo.all().to_json
end

get '/add' do
  begin
    insert()
  rescue => e
    p e
  end
  "added new entry"
end
