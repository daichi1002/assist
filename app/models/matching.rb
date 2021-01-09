class Matching < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  validates :title, :need_id, :detail, :contact_information, presence: true
end
