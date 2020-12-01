require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'お名前(姓)', with: @user.first_name
      fill_in 'お名前(名)', with: @user.last_name
      fill_in 'お名前カナ(セイ)', with: @user.first_name_kana
      fill_in 'お名前カナ(メイ)', with: @user.last_name_kana
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード(確認)', with: @user.password_confirmation
      find('#state').find("option[value='1']").select_option
      fill_in '電話番号', with: @user.phone_number
      find('#user_birth_day_1i').find("option[value='1994']").select_option
      find('#user_birth_day_2i').find("option[value='10']").select_option
      find('#user_birth_day_3i').find("option[value='2']").select_option
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('新規登録')
      visit new_user_registration_path
      fill_in 'お名前(姓)', with: ''
      fill_in 'お名前(名)', with: ''
      fill_in 'お名前カナ(セイ)', with: ''
      fill_in 'お名前カナ(メイ)', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード(確認)', with: ''
      find('#state').find("option[value='']").select_option
      fill_in '電話番号', with: ''
      find('#user_birth_day_1i').find("option[value='']").select_option
      find('#user_birth_day_2i').find("option[value='']").select_option
      find('#user_birth_day_3i').find("option[value='']").select_option
      expect do
        find('input[name="commit"]').click
      end.to change { User.count }.by(0)
      expect(current_path).to eq '/users'
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
    end
  end

  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq new_user_session_path
    end
  end
end
