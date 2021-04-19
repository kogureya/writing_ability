require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録機能' do
    context '新規登録できる時' do
      it '必要なデータが全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
  end
end
