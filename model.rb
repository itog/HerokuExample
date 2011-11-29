
require 'rubygems'
require 'dm-core'
require 'dm-timestamps'

#========== Model ==========
class Foo
  include DataMapper::Resource
  property :_id, Serial
  property :created_at, DateTime

  has 1, :bar
end

class Bar
  include DataMapper::Resource
  property :_id, Serial 
  property :created_at, DateTime


  belongs_to :foo
end
