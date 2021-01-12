require 'rails_helper'

RSpec.describe 'ニーズ投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @matching = FactoryBot.build(:matching)
  end

  context 'ニーズの投稿ができるとき' do
    it 'ログインした個人ユーザーは記事を投稿できる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_content('ビジネスマッチング')
      visit matchings_path
      expect(page).to have_content('ニーズを投稿する')
      visit new_matching_path
      fill_in 'タイトル', with: @matching.title
      find('#need').find("option[value='1']").select_option
      find('#area').find("option[value='1']").select_option
      fill_in '詳細', with: @matching.detail
      find('#matching_end_date_1i').find("option[value='2021']").select_option
      find('#matching_end_date_2i').find("option[value='10']").select_option
      find('#matching_end_date_3i').find("option[value='2']").select_option
      fill_in 'ご連絡先', with: @matching.contact_information
      fill_in 'URL', with: @matching.url
      expect do
        find('input[name="commit"]').click
      end.to change { Matching.count }.by(1)
      expect(current_path).to eq matchings_path
    end
  end

  context 'ニーズの投稿ができないとき' do
    it 'ログインしていないとビジネスマッチングページに遷移できない' do
      visit root_path
      expect(page).to have_no_content('ビジネスマッチング')
    end

    it '誤った情報を入力すると投稿ができない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_content('ビジネスマッチング')
      visit matchings_path
      expect(page).to have_content('ニーズを投稿する')
      visit new_matching_path
      fill_in 'タイトル', with: ''
      find('#need').find("option[value='']").select_option
      fill_in '詳細', with: @matching.detail
      find('#matching_end_date_1i').find("option[value='']").select_option
      find('#matching_end_date_2i').find("option[value='']").select_option
      find('#matching_end_date_3i').find("option[value='']").select_option
      fill_in 'ご連絡先', with: ''
      fill_in 'URL', with: ''
      expect do
        find('input[name="commit"]').click
      end.to change { Matching.count }.by(0)
      expect(current_path).to eq matchings_path
    end
  end
end
