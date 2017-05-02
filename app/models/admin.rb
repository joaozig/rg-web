class Admin < ActiveRecord::Base
  validates :name, presence: true

  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable
end
