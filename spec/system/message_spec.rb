require 'rails_helper'

RSpec.describe 'メッセージ機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:thrid_user){ FactoryBot.create(:thrid_user)}
  let!(:status) { FactoryBot.create(:status,user: user)}

  describe 'メッセージを行うことができる' do
    context 'ユーザが他のユーザにメッセージを送信した場合' do
      it 'メッセージを送信することができる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user10@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'ステータスを作成する'
        fill_in 'status_name', with: '仕事中'
        fill_in 'status_description', with: 'wedアプリを作成しています'
        click_button 'ステータス登録'
        find("input[name='status[status_id]'][value='#{Status.last.id}']").choose
        click_button 'ステータス登録'
        click_link 'ユーザー一覧'
        click_button 'フォロー'
        # binding.pry
        click_link 'マイページ'
        click_link '1'
        click_link 'メッセージ'
        fill_in 'message_body', with: 'お疲れ様です。'
        click_button 'メッセージを送る'
        expect(page).to have_content 'お疲れ様です'
      end
    end
  end
end