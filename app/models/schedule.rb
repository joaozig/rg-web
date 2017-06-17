class Schedule < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :place

  BR_DAYNAMES = %w(Domingo Segunda-feira Terça-feira Quarta-feira Quinta-feira Sexta-feira Sábado)

  def day_of_week
  	BR_DAYNAMES[day]
  end
end
