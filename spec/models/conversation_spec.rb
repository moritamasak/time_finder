require 'rails_helper'

RSpec.describe Conversation, type: :model do
  let(:user1) { FactoryBot.create(:user, email: 'user1@example.com') }
  let(:user2) { FactoryBot.create(:user, email: 'user2@example.com') }

  describe 'バリデーション' do
    context 'senderとrecipientが異なる場合' do
      it '有効であること' do
        conversation = Conversation.new(sender: user1, recipient: user2)
        expect(conversation).to be_valid
      end
    end

    context 'senderとrecipientが同じ場合' do
      it '無効であること' do
        FactoryBot.create(:conversation, sender: user1, recipient: user2)
        conversation = Conversation.new(sender: user1, recipient: user2)
        expect(conversation).to_not be_valid
      end
    end
  end
end

