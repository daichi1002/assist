require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの投稿' do
    context 'コメントが投稿できる場合' do
      it '全ての要素が存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'textが空では投稿できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('コメントを入力してください')
      end
      it 'userが紐づいていなければ（ログインしていなければ）投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end
      it 'articleが紐づいていなければ投稿できない' do
        @comment.article = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Articleを入力してください')
      end
    end
  end
end
