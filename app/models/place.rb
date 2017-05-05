class Place < ActiveRecord::Base
  belongs_to :neighborhood
  validates :name, :address, presence: true
end
