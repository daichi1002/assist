class Article < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :genre
  belongs_to :type
  has_one_attached :image

  validates :image, :title, :genre_id, :type_id, :area_id, :maximum_price, :start_date, :end_date, :information, :url, presence: true
end
