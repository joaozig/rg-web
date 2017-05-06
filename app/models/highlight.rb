class Highlight < ActiveRecord::Base
	enum highlight_type: [ :news, :franchise, :restaurant, :place, :category ]

  has_many :posts
  belongs_to :franchise
  belongs_to :restaurant
  belongs_to :place
  belongs_to :category

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
end
