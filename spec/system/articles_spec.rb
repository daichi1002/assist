require 'rails_helper'

RSpec.describe "記事投稿", type: :system do
  before do
    @user = User.create!(
      first_name: '管理者',
      last_name: '太郎',
      first_name_kana: 'カンリシャ',
      last_name_kana: 'タロウ',
      email: 'admin@example.com',
      password: 'daichi1002',
      password_confirmation: 'daichi1002',
      state_id: 45,
      phone_number: '09012345678',
      birth_day: '1994-10-02',
      admin: true
    )
    @user1 = FactoryBot.create(:user)
    @article = FactoryBot.build(:article)
  end

  context '記事の投稿ができるとき' do 
    it 'ログインした管理者は記事を投稿できる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_content('新規投稿')
      visit new_admin_article_path
      attach_file '画像', 'app/assets/images/list1.png'
      fill_in 'タイトル', with: @article.title
      find("#type").find("option[value='1']").select_option
      find("#genre").find("option[value='1']").select_option
      find("#area").find("option[value='1']").select_option
      fill_in '上限金額', with: @article.maximum_price
      find("#article_start_date_1i").find("option[value='2020']").select_option
      find("#article_start_date_2i").find("option[value='10']").select_option
      find("#article_start_date_3i").find("option[value='2']").select_option
      find("#article_end_date_1i").find("option[value='2021']").select_option
      find("#article_end_date_2i").find("option[value='10']").select_option
      find("#article_end_date_3i").find("option[value='2']").select_option
      fill_in '詳細', with: @article.information
      fill_in 'URL', with: @article.url
      expect {
        find('input[name="commit').click
      }.to change { Article.count }.by(1)
      expect(current_path).to eq root_path
    end
  end

  context '記事の投稿ができないとき' do
    it 'ログインしていないと新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_no_content('新規投稿')
    end

    it '一般ユーザーがログインしていると新規投稿ページに遷移できない' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user1.email
      fill_in 'パスワード', with: @user1.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      expect(page).to have_no_content('新規投稿')
    end
  end
end