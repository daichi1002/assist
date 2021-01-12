class Matching < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to :company, optional: true
  belongs_to :area

  validates :title, :area_id, :need_id, :detail, :contact_information, presence: true
end
