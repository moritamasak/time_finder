require 'rails_helper'

RSpec.describe 'ユーザ機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user){FactoryBot.create(:second_user)}

  describe 'ユーザ新規作成機能' do
    context 'ユーザが新規作成した場合' do
      it 'ユーザが新規作成できる' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'user'
        fill_in 'user_email', with: 'user@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button '新規登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end
  end

  describe 'ログイン機能' do
    context 'ログインした場合' do
      it 'ログインした時にステータス一覧画面に遷移' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user10@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました'
      end
    end

    context 'ログインした場合' do
      it 'ステータスを登録せずにマイページに遷移する' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user10@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'マイページ'
        expect(page).to have_content 'ステータスが登録されていません。'
      end
    end

    context 'ログアウトした場合' do
      it 'ログアウトするとトップページに戻る' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user10@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
  end

  describe '管理者のログイン機能のテスト' do
    context '管理ユーザが管理画面にアクセスする場合' do
      it 'ページに遷移することができる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'admin10@example.com'
        fill_in 'user_password', with: 'admin_password'
        click_button "ログイン"
        click_link '管理者画面'
        expect(page).to have_content 'Time Finder Admin'
      end
    end
  end

end