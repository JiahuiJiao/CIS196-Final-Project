# A item in request has from id and to id
class Request < ActiveRecord::Base
  belongs_to :from
  belongs_to :to
end
