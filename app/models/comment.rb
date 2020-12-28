class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  validates :text, presence: true
end
