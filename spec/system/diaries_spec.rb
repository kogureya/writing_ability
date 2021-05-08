require 'rails_helper'

RSpec.describe "日記投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @diary_title = Faker::Lorem.sentence
    @diary_text = Faker::Lorem.sentence
  end
  context '日記投稿できるとき' do
    it 'ログインしているユーザーは日記投稿ができる' do
      # ログインする
      visit new_user_session_path
      fill_in 'Eメール', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq(root_path)
      # 日記作成リンクがあることを確認する
      expect(page).to have_content('日記作成')
      # 日記作成ページへ移動する
      visit new_diary_path
      # フォームに情報を入力する
      fill_in 'タイトル', with: @diary_title
      fill_in '本文', with: @diary_text
      # 送信するとDiaryモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change {Diary.count}.by(1)
      # トップページに遷移する
      expect(current_path).to eq(root_path)
      # トップページに投稿した日記が表示されることを確認する
      expect(page).to have_content(@diary_title)
    end
  end
  context '日記投稿できないとき' do
    it 'ログインしていないと日記投稿はできない' do
      # トップページに遷移する
      visit root_path
      # 日記投稿ページへのリンクがない
      expect(page).to have_no_content('日記作成')
    end
  end
end
