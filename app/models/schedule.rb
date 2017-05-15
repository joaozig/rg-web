class Schedule < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :place
end
