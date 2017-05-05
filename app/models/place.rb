class Place < ActiveRecord::Base
  belongs_to :neighborhood
  has_and_belongs_to_many :infos

  validates :name, :address, :neighborhood, presence: true
end
