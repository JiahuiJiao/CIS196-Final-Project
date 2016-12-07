# A item in UsersEvent table belongs to a user and an event
class UsersEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end
