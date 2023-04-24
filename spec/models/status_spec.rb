require 'rails_helper'

RSpec.describe Status, type: :model do
  describe 'バリデーション' do
    let(:user) { FactoryBot.create(:user) }
    let(:status) { FactoryBot.build(:status, user: user) }

    context '正常なデータの場合' do
      it 'バリデーションが通ること' do
        expect(status).to be_valid
      end
    end

    context 'nameが空の場合' do
      it 'バリデーションが通らないこと' do
        status.name = ''
        expect(status).not_to be_valid
      end
    end

    context 'userが存在しない場合' do
      it 'バリデーションが通らないこと' do
        status.user = nil
        expect(status).not_to be_valid
      end
    end
  end
end
