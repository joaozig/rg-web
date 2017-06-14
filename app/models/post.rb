class Post < ActiveRecord::Base
  belongs_to :highlight
  belongs_to :franchise
  belongs_to :restaurant
  belongs_to :place

  has_attached_file :image, styles: { default: "300x300>" },
    path: '/posts/:style/:id/:filename', :url => ':s3_domain_url'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :title, presence: true

  def image_url
  	image.url(:default)
  end
end
