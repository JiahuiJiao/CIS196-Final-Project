# A item in EventsUser belongs to event and user
class EventsUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
end
