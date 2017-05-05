class Info < ActiveRecord::Base
  has_and_belongs_to_many :places
  has_and_belongs_to_many :restaurants

  validates :title, :icon, presence: true
end
