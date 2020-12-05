require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
    @article.image = fixture_file_upload("app/assets/images/list1.png")
  end

  describe '記事の投稿' do
    context "記事が保存できる場合" do
      it "全ての要素が存在すれば保存できる" do
        expect(@article).to be_valid
      end
    end
    context "記事が保存できない場合" do
      it "画像が空では保存できない" do
        @article.image = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('画像を入力してください')
      end     
      it "タイトルが空では保存できない" do
        @article.title = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('タイトルを入力してください')
      end
      it "種類が空では保存できない" do
        @article.type_id = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('種類を入力してください')
      end   
      it "ジャンルが空では保存できない" do
        @article.genre_id = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('ジャンルを入力してください')
      end   
      it "エリアが空では保存できない" do
        @article.area_id = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('エリアを入力してください')
      end   
      it "取扱開始日が空では保存できない" do
        @article.start_date = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('取扱開始日を入力してください')
      end   
      it "取扱終了日が空では保存できない" do
        @article.end_date = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('取扱終了日を入力してください')
      end   
      it "詳細が空では保存できない" do
        @article.information = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('詳細を入力してください')
      end
      it "URLが空では保存できない" do
        @article.url = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('URLを入力してください')
      end 
    end
  end 
end