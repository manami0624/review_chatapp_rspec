require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ新規投稿' do
    context '投稿できる場合' do
      it 'contentがあれば投稿できる' do
        expect(@message).to be_valid
      end

      it 'contentが空でも投稿できる' do
        @message.content = ''
        expect(@message).to be_valid
      end

      it 'imageが空でも投稿できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end

    context '投稿できない場合' do
      it 'メッセージと画像どちらも空では保存できない' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end

      it 'ユーザーが紐づいていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("User must exist")
      end

      it 'roomが紐づいていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Room must exist")
      end
    end
  end
end
