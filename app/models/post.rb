class Post < ActiveRecord::Base
  belongs_to :highlight
  belongs_to :franchise
  belongs_to :restaurant
  belongs_to :place

  validates :title, presence: true
end
