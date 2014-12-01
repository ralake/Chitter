require 'dm-timestamps'

class Peep

  include DataMapper::Resource

  property :id,        Serial
  property :message,   String
  property :author,    String
  property :username,  String
  property :created,   String

  belongs_to :user
  
end