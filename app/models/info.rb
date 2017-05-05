class Info < ActiveRecord::Base
	validates :title, :icon, presence: true
end
