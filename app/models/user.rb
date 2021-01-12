class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  has_many :sns_credentials, dependent: :destroy
  has_many :article
  has_many :likes
  has_many :liked_articles, through: :likes, source: :article
  has_many :comments, dependent: :destroy
  has_many :matchings
  belongs_to :need

  def liked_by?(article_id)
    likes.where(article_id: article_id).exists?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :state_id, :phone_number, :birth_day, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, on: :create, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
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

  def self.guest
    find_or_create_by!(first_name: 'ユーザー', last_name: 'ゲスト', first_name_kana: 'ユーザー', last_name_kana: 'ゲスト', email: 'guest@example.com', state_id: 1, phone_number: '09012345678', birth_day: '1994-10-02') do |user|
      user.password = SecureRandom.hex(10)
    end
  end

  def self.admin
    find_or_create_by!(email: 'admin@example.com') do |guest_admin|
      guest_admin.password = ENV[admin_pass]
    end
  end

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
