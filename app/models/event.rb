# Event table
class Event < ActiveRecord::Base
  belongs_to :creator
  has_many :events_users, dependent: :destroy
  has_many :users, through: :events_users
end
