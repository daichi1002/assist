require 'rails_helper'

RSpec.describe '法人会員新規登録', type: :system do
  before do
    @company = FactoryBot.build(:company)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      visit root_path
      expect(page).to have_content('法人会員はこちら')
      visit new_company_session_path
      expect(page).to have_content('新規会員登録はこちら')
      visit new_company_registration_path
      fill_in '会社名', with: @company.company_name, match: :first
      fill_in '会社名（カナ）', with: @company.company_name_kana
      fill_in 'メールアドレス', with: @company.email
      fill_in 'パスワード', with: @company.password
      fill_in 'パスワード(確認)', with: @company.password_confirmation
      fill_in '郵便番号', with: @company.postal_code
      fill_in '住所', with: @company.address
      fill_in '電話番号', with: @company.phone_number
      fill_in '企業紹介', with: @company.introduction
      fill_in '担当者名', with: @company.staff
      expect do
        find('input[name="commit"]').click
      end.to change { Company.count }.by(1)
      expect(current_path).to eq companies_articles_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
    end
  end

  context '法人会員新規登録ができないとき' do
    it '誤った情報では法人会員新規登録ができずに新規登録ページへ戻ってくる' do
      visit root_path
      expect(page).to have_content('法人会員はこちら')
      visit new_company_session_path
      expect(page).to have_content('新規会員登録はこちら')
      visit new_company_registration_path
      fill_in '会社名', with: '', match: :first
      fill_in '会社名（カナ）', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワード(確認)', with: ''
      fill_in '郵便番号', with: ''
      fill_in '住所', with: ''
      fill_in '電話番号', with: ''
      fill_in '企業紹介', with: ''
      fill_in '担当者名', with: ''
      expect do
        find('input[name="commit"]').click
      end.to change { Company.count }.by(0)
      expect(current_path).to eq '/companies'
    end
  end
end

RSpec.describe '法人会員ログイン', type: :system do
  before do
    @company = FactoryBot.create(:company)
  end
  context 'ログインができるとき' do
    it '保存されている法人会員の情報と合致すればログインができる' do
      visit root_path
      expect(page).to have_content('法人会員はこちら')
      visit new_company_session_path
      fill_in 'メールアドレス', with: @company.email
      fill_in 'パスワード', with: @company.password
      find('input[name="commit"]').click
      expect(current_path).to eq companies_articles_path
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('新規登録')
    end
  end

  context 'ログインができないとき' do
    it '保存されている法人会員の情報と合致しないとログインができない' do
      visit root_path
      expect(page).to have_content('法人会員はこちら')
      visit new_company_session_path
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      find('input[name="commit"]').click
      expect(current_path).to eq new_company_session_path
    end
  end
end
