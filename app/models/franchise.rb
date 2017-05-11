class Franchise < ActiveRecord::Base
  has_many :restaurants
  has_and_belongs_to_many :categories

  has_attached_file :logo, styles: { default: "150x150#" },
    path: '/franchises/logos/:style/:id/:filename', :url => ':s3_domain_url'
  has_attached_file :image, styles: { default: "300x300>" },
    path: '/highlights/images/:style/:id/:filename', :url => ':s3_domain_url'

  validates_attachment_content_type :logo, :image, content_type: /\Aimage\/.*\z/

  validates :name, presence: true
end
