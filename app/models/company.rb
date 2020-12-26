class Company < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :company_name, :company_name_kana, :email, :postal_code, :address, :phone_number, :introduction, :staff, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  validates :postal_code, format: { with: /\A\d{7}\z/, message: 'は数字のみで入力してください' }

  validates :phone_number, format: { with: /\A\d{11}\z/, message: 'は数字のみで入力してください' }

  def self.login
    find_or_create_by!(company_name: '株式会社ゲストログイン', company_name_kana: 'カ）ゲストログイン', email: 'company@example.com', postal_code: '1234567', address: '宮崎県宮崎市宮崎1-1', phone_number: '09012345678', introduction: 'テスト', staff: '営業部長 田中') do |guest_company|
      guest_company.password = SecureRandom.hex(10)
    end
  end
end