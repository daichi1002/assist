class Like < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true
  belongs_to :company, optional: true
end
