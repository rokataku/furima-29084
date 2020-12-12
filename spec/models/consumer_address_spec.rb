require 'rails_helper'

RSpec.describe ConsumerAddress, type: :model do
  before do
    @consumer_address = FactoryBot.build(:consumer_address)
  end

  it "tokenがあれば保存できること" do
    expect(@consumer_address).to be_valid
  end

  it "tokenが空では登録できないこと" do
    @consumer_address.token = nil
    @consumer_address.valid?
    expect(@consumer_address.errors.full_messages).to include("Token can't be blank")
  end
end
