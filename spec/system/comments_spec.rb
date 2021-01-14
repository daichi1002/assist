require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @article = FactoryBot.create(:article)
    @comment = FactoryBot.build(:comment)
  end

  context 'コメントの投稿ができるとき' do
    it 'ログインした個人ユーザーはコメントを投稿できる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      visit article_path(@article)
      expect(page).to have_selector('.fa-comments')
      visit new_article_comment_path(@article)
      fill_in '内容', with: @comment.text
      expect do
        find('input[name="commit"]').click
      end.to change { Comment.count }.by(1)
      expect(current_path).to eq article_comments_path(@article)
    end
  end

  context 'コメントの投稿ができないとき' do
    it 'ログインしていない個人ユーザーはコメントを投稿できない' do
      visit root_path
      visit article_path(@article)
      expect(page).to have_no_selector('.fa-comments')
    end
  end
end
