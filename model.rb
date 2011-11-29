
require 'rubygems'
require 'dm-core'
require 'dm-timestamps'

#========== Model ==========
class DeviceInfo
  include DataMapper::Resource
  property :_id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime

  has 1, :buildInfo
end

class BuildInfo
  include DataMapper::Resource
  property :_id, Serial 
  property :VERSION_d_SDK, Text

  belongs_to :device_info
end
