class Company < ApplicationRecord
  has_many :likes
  has_many :liked_articles, through: :likes, source: :article
  has_many :comments, dependent: :destroy

  def liked_by?(article_id)
    likes.where(article_id: article_id).exists?
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :company_name, :company_name_kana, :email, :postal_code, :address, :phone_number, :introduction, :staff, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :postal_code, format: { with: /\A\d{7}\z/, message: 'は数字のみで入力してください' }

  validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は数字のみで入力してください' }
end