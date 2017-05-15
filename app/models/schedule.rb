class Schedule < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :place

  def day_of_week
  	Date::DAYNAMES[day]
  end
end
