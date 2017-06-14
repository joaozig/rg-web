class Place < ActiveRecord::Base
  belongs_to :neighborhood
  has_many :schedules, :dependent => :destroy
  has_many :restaurants
  has_and_belongs_to_many :infos

  accepts_nested_attributes_for :schedules

  has_attached_file :logo, styles: { default: "150x150#" },
    path: '/places/logos/:style/:id/:filename', :url => ':s3_domain_url'

  has_attached_file :image, styles: { default: "300x300>" },
    path: '/places/images/:style/:id/:filename', :url => ':s3_domain_url'
  validates_attachment_content_type :logo, :image, content_type: /\Aimage\/.*\z/

  validates :name, :address, :neighborhood, presence: true

  def logo_url
    logo.url(:default)
  end

  def image_url
    image.url(:default)
  end
end
