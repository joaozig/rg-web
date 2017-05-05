class Franchise < ActiveRecord::Base
  has_many :restaurants
  has_and_belongs_to_many :categories

  validates :name, presence: true
end
