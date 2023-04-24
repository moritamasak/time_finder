require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '名前、メールアドレス、パスワードがあれば有効であること' do
      user = FactoryBot.build(:user)
      expect(user).to be_valid
    end

    it '名前がなければ無効であること' do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it 'メールアドレスがなければ無効であること' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it '重複したメールアドレスは無効であること' do
      FactoryBot.create(:user, email: 'duplicate@example.com')
      user = FactoryBot.build(:user, email: 'duplicate@example.com')
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end

    it 'パスワードがなければ無効であること' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
  end

  describe 'アソシエーション' do
    it 'Userが削除されると、関連するStatusも削除されること' do
      user = FactoryBot.create(:user)
      FactoryBot.create(:status, user: user)
      expect { user.destroy }.to change { Status.count }.by(-1)
    end

    it 'Userが削除されると、関連するFollowerも削除されること' do
      user = FactoryBot.create(:user)
      FactoryBot.create(:follower, boss: user)
      expect { user.destroy }.to change { Follower.count }.by(-1)
    end
  end

  describe 'メソッド' do
    let(:user) { FactoryBot.create(:user) }
    let(:other_user) { FactoryBot.create(:thrid_user) }

    describe '#is_followed_by?' do
      context 'フォローされている場合' do
        let!(:follower) { FactoryBot.create(:follower, boss: other_user, subordinate: user) }
        it 'trueを返すこと' do
          FactoryBot.create(:follower, boss: user, subordinate: other_user)
          expect(user.is_followed_by?(other_user)).to be_truthy        end
      end

      context 'フォローされていない場合' do
        it 'falseを返すこと' do
          expect(user.is_followed_by?(other_user)).to be_falsey
        end
      end
    end
  end
end
