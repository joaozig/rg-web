class User < ActiveRecord::Base
  has_secure_password

  belongs_to :neighborhood

  enum gender: [ :masculino, :feminino ]

  validates :name, :email, presence: true
  validates :password, presence: { on: :create }
  validates :email, uniqueness: { case_sensitive: false }
end
