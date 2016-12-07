# A item in UsersFriend table belows the user and the user's friend
class UsersFriend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
