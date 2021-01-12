require 'rails_helper'

RSpec.describe Matching, type: :model do
  before do
    @matching = FactoryBot.build(:matching)
  end

  describe 'ニーズの投稿' do
    context '投稿が保存できる場合' do
      it '全ての要素が存在すれば保存できる' do
        expect(@matching).to be_valid
      end
      it '募集期限(end_date)が空欄でも保存できる' do
        @matching.end_date = nil
        expect(@matching).to be_valid
      end
      it 'URLが空欄でも保存できる' do
        @matching.url = nil
        expect(@matching).to be_valid
      end
    end
    context '投稿が保存できない場合' do
      it 'タイトル(title)が空では保存できない' do
        @matching.title = nil
        @matching.valid?
        expect(@matching.errors.full_messages).to include('タイトルを入力してください')
      end
      it '種類(need_id)が空では保存できない' do
        @matching.need_id = nil
        @matching.valid?
        expect(@matching.errors.full_messages).to include('ニーズを入力してください')
      end
      it '募集地域(area_id)が空では保存できない' do
        @matching.area_id = nil
        @matching.valid?
        expect(@matching.errors.full_messages).to include('募集地域を入力してください')
      end
      it '詳細(detail)が空では保存できない' do
        @matching.detail = nil
        @matching.valid?
        expect(@matching.errors.full_messages).to include('詳細を入力してください')
      end
      it 'ご連絡先(contact_information)が空では保存できない' do
        @matching.contact_information = nil
        @matching.valid?
        expect(@matching.errors.full_messages).to include('ご連絡先を入力してください')
      end
    end
  end
end
