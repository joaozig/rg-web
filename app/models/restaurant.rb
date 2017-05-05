class Restaurant < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :neighborhood

  validates :franchise, :name, :address, :neighborhood, presence: true
end
