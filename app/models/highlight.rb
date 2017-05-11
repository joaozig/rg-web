class Highlight < ActiveRecord::Base
  enum highlight_type: [ :news, :franchise, :restaurant, :place, :category ]
	enum status: [ :unpublished, :published ]

  has_many :posts
  belongs_to :franchise
  belongs_to :restaurant
  belongs_to :place
  belongs_to :category

  has_attached_file :image, styles: { default: "300x300>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :highlight_type, presence: true
  validates :title, :content, presence: true, if: 'news?'
  validates :franchise, presence: true, if: 'franchise?'
  validates :restaurant, presence: true, if: 'restaurant?'
  validates :place, presence: true, if: 'place?'
  validates :category, presence: true, if: 'category?'

  def generic_title
  	case highlight_type
  	when 'franchise'
  		franchise.name
  	when 'restaurant'
  		restaurant.name
  	when 'place'
  		place.name
  	when 'category'
  		category.name
  	else
  		title
  	end
  end

  def status_action_label
    case status
    when 'unpublished'
      'publish?'
    when 'published'
      'unpublish?'
    end
  end
end
