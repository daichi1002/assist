require 'rails_helper'
describe Company do
  before do
    @company = FactoryBot.build(:company)
  end

  describe '法人会員新規登録' do
    context '新規登録がうまくいくとき' do
      it '全項目入力されていれば登録できる' do
        expect(@company).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '会社名が空では登録できない' do
        @company.company_name = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('会社名を入力してください')
      end
      it '会社名が空では登録できない' do
        @company.company_name_kana = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('会社名（カナ）を入力してください')
      end
      it 'メールアドレスが空では登録できない' do
        @company.email = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '重複したメールアドレスが存在する場合登録できない' do
        @company.save
        another_company = FactoryBot.build(:company)
        another_company.email = @company.email
        another_company.valid?
        expect(another_company.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'パスワードが空では登録できない' do
        @company.password = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが5文字以下であれば登録できない' do
        @company.password = 'aiu12'
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードが存在してもパスワード（確認）が空では登録できない' do
        @company.password_confirmation = ''
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません'), 'パスワードを入力してください'
      end
      it 'パスワードが数字のみであれば登録できない' do
        @company.password = '123456789'
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが英字のみであれば登録できない' do
        @company.password = 'abcdefghi'
        @company.valid?
        expect(@company.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it '郵便番号が空では登録できない' do
        @company.postal_code = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('郵便番号を入力してください')
      end
      it '郵便番号がハイフンを含まない、７桁以内の数字でなければ登録できない' do
        @company.postal_code = '123-4567'
        @company.valid?
        expect(@company.errors.full_messages).to include('郵便番号は数字のみで入力してください')
      end
      it '住所が空では登録できない' do
        @company.address = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('住所を入力してください')
      end
      it '電話番号が空では登録できない' do
        @company.phone_number = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('電話番号を入力してください')
      end
      it '電話番号がハイフンを含まない、11桁以内の数字でなければ登録できない' do
        @company.phone_number = '090-1234-5678'
        @company.valid?
        expect(@company.errors.full_messages).to include('電話番号は数字のみで入力してください')
      end
      it '企業紹介が空では登録できない' do
        @company.introduction = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('企業紹介を入力してください')
      end
      it '担当者名が空では登録できない' do
        @company.staff = nil
        @company.valid?
        expect(@company.errors.full_messages).to include('担当者名を入力してください')
      end
    end
  end
end
