require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
end

  describe 'ルーム登録' do
    context '登録できる場合' do
      it 'ルーム名があれば登録できる' do
      expect(@room).to be_valid
      end
    end

    context '登録ができない場合' do
      it 'ルーム名がないと登録できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end