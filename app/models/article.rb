class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :genre
  belongs_to :type
  has_one_attached :image
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :image, :title, :genre_id, :type_id, :area_id, :maximum_price, :start_date, :end_date, :information, :url, presence: true
end
