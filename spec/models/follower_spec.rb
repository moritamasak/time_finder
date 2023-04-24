require 'rails_helper'

RSpec.describe Follower, type: :model do
  let(:user1) { FactoryBot.create(:user, email: 'user1@example.com') }
  let(:user2) { FactoryBot.create(:user, email: 'user2@example.com') }
  let(:follower) { Follower.new(boss: user1, subordinate: user2) }

  describe 'バリデーション' do
    context 'bossとsubordinateが存在する場合' do
      it '有効であること' do
        expect(follower).to be_valid
      end
    end

    context 'bossが存在しない場合' do
      it '無効であること' do
        follower.boss = nil
        expect(follower).to_not be_valid
      end
    end

    context 'subordinateが存在しない場合' do
      it '無効であること' do
        follower.subordinate = nil
        expect(follower).to_not be_valid
      end
    end
  end
end
