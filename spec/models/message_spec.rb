require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:user) { FactoryBot.create(:user, email: "user1@example.com") }
  let(:recipient) { FactoryBot.create(:user, email: "user2@example.com") }
  let(:conversation) { FactoryBot.create(:conversation, sender: user, recipient: recipient) }
  let(:message) { FactoryBot.build(:message, conversation: conversation, user: user) }

  describe 'バリデーション' do
    context '正常なデータの場合' do
      it 'バリデーションが通ること' do
        expect(message).to be_valid
      end
    end

    context 'bodyが空の場合' do
      it 'バリデーションが通らないこと' do
        message.body = ''
        expect(message).to_not be_valid
      end
    end

    context 'conversationが存在しない場合' do
      it 'バリデーションが通らないこと' do
        message.conversation = nil
        expect(message).to_not be_valid
      end
    end

    context 'userが存在しない場合' do
      it 'バリデーションが通らないこと' do
        message.user = nil
        expect(message).to_not be_valid
      end
    end
  end
end

