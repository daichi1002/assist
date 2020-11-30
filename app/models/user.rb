class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  has_many :sns_credentials, dependent: :destroy

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :state_id, :phone_number, :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
  validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
  validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで入力してください' }
  validates :last_name_kana,  presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで入力してください' }
  validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は数字のみで入力してください' }
  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      first_name: auth.info.last_name,
      last_name: auth.info.first_name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
