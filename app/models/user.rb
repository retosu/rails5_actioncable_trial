class User < ActiveRecord::Base
  has_many :providers
  has_many :messages
end
