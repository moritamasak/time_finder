require 'rails_helper'

RSpec.describe 'ステータス機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user){ FactoryBot.create(:second_user)}
  let!(:status) { FactoryBot.create(:status,user: user)}

  # describe 'ステータスを新規作成' do
  #   context 'ユーザがステータスを新規作成した場合' do
  #     it 'ステータスを作成できる' do
  #       visit new_user_session_path
  #       fill_in 'user_email', with: 'user10@example.com'
  #       fill_in 'user_password', with: 'password'
  #       click_button 'ログイン'
  #       click_link 'ステータスを作成する'
  #       fill_in 'status_name', with: '仕事中'
  #       fill_in 'status_description', with: 'wedアプリを作成しています'
  #       click_button 'ステータス登録'
  #       expect(page).to have_content '仕事中'
  #     end
  #   end
  # end

  describe 'ステータスを登録' do
    context 'ユーザがステータスを登録した場合' do
      it 'ステータスを登録できる' do
        visit new_user_session_path
        fill_in 'user_email', with: 'user10@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'ステータスを作成する'
        fill_in 'status_name', with: '仕事中'
        fill_in 'status_description', with: 'wedアプリを作成しています'
        click_button 'ステータス登録'
        # binding.pry
        find("input[name='status[status_id]'][value='#{Status.last.id}']").choose
        click_button 'ステータス登録'
        expect(page).to have_content '仕事中'
      end
    end
  end
  


end