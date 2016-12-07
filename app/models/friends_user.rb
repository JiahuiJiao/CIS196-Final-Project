# A item in FriendsUser belong to friend and user
class FriendsUser < ActiveRecord::Base
  belongs_to :friend, class_name: 'User'
  belongs_to :user
end
