require 'rails_helper'

RSpec.describe 'コメント投稿', type: :system do
  before do
    @article = FactoryBot.create(:article)
    @user = FactoryBot.create(:user)
    @comment = FactoryBot.build(:comment)
  end

  context 'コメントの投稿ができるとき' do
    it 'ログインしたユーザーは記事詳細ページでコメント投稿できる' do
      visit root_path
      expect(page).to have_content('ログイン')
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      visit article_path(@article)
      find('.comment-btn').click
      expect(current_path).to eq new_article_comment_path(@article)
      fill_in '内容', with: @comment
      expect do
        find('input[name="commit"]').click
      end.to change { Comment.count }.by(1)
      expect(page).to have_content @comment
    end
  end

  context 'コメントの投稿ができないとき' do
    it 'ログインしていないユーザーはコメント投稿ページへ遷移できない' do
      visit root_path
      visit article_path(@article)
      expect(page).to have_no_link('#comment-btn')
    end
  end
end
