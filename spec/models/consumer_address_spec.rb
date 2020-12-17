require 'rails_helper'

RSpec.describe ConsumerAddress, type: :model do
  before do
    @consumer_address = FactoryBot.build(:consumer_address)
  end
  context '購入が成功する場合' do
    it 'building_nameは空でも保存できること' do
      @consumer_address.building_name = nil
      expect(@consumer_address).to be_valid
    end
    it "tokenがあれば保存できること" do
      expect(@consumer_address).to be_valid
    end
  end

  context '購入が失敗する場合' do
    it 'postal_codeが空だと保存できないこと' do
      @consumer_address.postal_code = nil
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @consumer_address.postal_code = '1111111'
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @consumer_address.prefecture_id = 1
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが空だと保存できないこと' do
      @consumer_address.prefecture_id = nil
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'cityが空だと保存できないこと' do
      @consumer_address.city = nil
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberが空だと保存できないこと' do
      @consumer_address.house_number = nil
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("House number can't be blank")
    end
    it 'phonenumberが空だと保存できないこと' do
      @consumer_address.phonenumber = nil
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Phonenumber can't be blank")
    end
    it 'phonenumberハイフンは不要' do
      @consumer_address.phonenumber = '123-4567-8910'
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Phonenumber is out of setting range")
    end
    it 'phonenumberハイフンは11桁以内でないと保存できないこと' do
      @consumer_address.phonenumber = '1234567891011'
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Phonenumber is out of setting range")
    end
    it "tokenが空では登録できないこと" do
      @consumer_address.token = nil
      @consumer_address.valid?
      expect(@consumer_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
