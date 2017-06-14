class Category < ActiveRecord::Base
	has_and_belongs_to_many :franchises
	validates :name, presence: true

  has_attached_file :image, styles: { default: "200x200#" },
    path: '/categories/images/:style/:id/:filename', :url => ':s3_domain_url'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
