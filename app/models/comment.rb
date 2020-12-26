class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  belongs_to :company

  validates :text, presence: true
end
