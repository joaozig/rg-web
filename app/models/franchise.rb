class Franchise < ActiveRecord::Base
	validates :name, presence: true
end
