class Restaurant < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :neighborhood
  has_and_belongs_to_many :infos

  validates :franchise, :name, :address, :neighborhood, presence: true
end
