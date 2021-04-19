require 'rails_helper'

RSpec.describe DiaryPoint, type: :model do
  before do
    user = FactoryBot.create(:user)
    @diary_point = FactoryBot.build(:diary_point, user_id: user.id)
  end

  describe '日記投稿機能' do
    context '日記投稿できる時' do
      it '必要なデータが全て存在すれば投稿できる' do
        expect(@diary_point).to be_valid
      end
    end

    context '日記投稿できない時' do
      it 'titleが空の時' do
        @diary_point.title = ""
        @diary_point.valid?
        expect(@diary_point.errors.full_messages).to include "Title can't be blank"
      end
      it 'textが空の時' do
        @diary_point.text = ""
        @diary_point.valid?
        expect(@diary_point.errors.full_messages).to include "Text can't be blank"
      end
    end
  end
end
