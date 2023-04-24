require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:thrid_user){ FactoryBot.create(:thrid_user)}
  let!(:status) { FactoryBot.create(:status,user: user)}

  describe 'フォローを行う' do
    context 'ユーザが他のユーザをフォローした場合' do
      it 'フォローすることができる' do
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
        click_link 'マイページ'
        expect(page).to have_content '1'
      end
    end
  end

  describe 'フォローの解除を行う' do
    context 'ユーザが他のユーザをフォローを解除した場合' do
      it 'フォローを解除することができる' do
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
        click_button 'フォロー解除'
        click_link 'マイページ'
        expect(page).to have_content '0'
      end
    end
  end

end