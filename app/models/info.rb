class Info < ActiveRecord::Base
  has_and_belongs_to_many :places
	validates :title, :icon, presence: true
end
