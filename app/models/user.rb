class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :state_id, :phone_number, :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで入力してください' }
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで入力してください' }
  validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は数字のみで入力してください' }
       
end
