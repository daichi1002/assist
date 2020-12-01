require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全項目入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '名前（姓）が空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（姓）を入力してください')
      end
      it '名前（姓）が全角入力でなければ登録できない' do
        @user.first_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（姓）は全角で入力してください')
      end
      it '名前（名）が空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名）を入力してください')
      end
      it '名前（名）が全角入力でなければ登録できない' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前（名）は全角で入力してください')
      end
      it '名前カナ（セイ）が空では登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（セイ）を入力してください')
      end
      it '名前カナ（セイ）が全角入力でなければ登録できない' do
        @user.first_name_kana = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（セイ）は全角カナで入力してください')
      end
      it '名前カナ（メイ）が空では登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（メイ）を入力してください')
      end
      it '名前カナ（メイ）が全角入力でなければ登録できない' do
        @user.last_name_kana = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ（メイ）は全角カナで入力してください')
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'パスワードが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'パスワードが5文字以下であれば登録できない' do
        @user.password = 'aiu12'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードが存在してもパスワード（確認）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません'), 'パスワードを入力してください'
      end
      it 'パスワードが数字のみであれば登録できない' do
        @user.password = '123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'パスワードが英字のみであれば登録できない' do
        @user.password = 'abcdefghi'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it '都道府県が空では登録できない' do
        @user.state_id = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('都道府県を入力してください')
      end
      it '電話番号が空では登録できない' do
        @user.phone_number = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号を入力してください')
      end
      it '電話番号がハイフンを含まない、11桁以内の数字でなければ登録できない' do
        @user.phone_number = '090-1234-5678'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は数字のみで入力してください')
      end
      it '生年月日が空では登録できない' do
        @user.birth_day = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
    end
  end
end
