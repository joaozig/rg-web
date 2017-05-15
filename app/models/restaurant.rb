class Restaurant < ActiveRecord::Base
  belongs_to :franchise
  belongs_to :neighborhood
  has_many :schedules, :dependent => :destroy
  has_and_belongs_to_many :infos

  accepts_nested_attributes_for :schedules

  has_attached_file :image, styles: { default: "300x300>" },
    path: '/restaurants/:style/:id/:filename', :url => ':s3_domain_url'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :franchise, :name, :address, :neighborhood, presence: true
end
