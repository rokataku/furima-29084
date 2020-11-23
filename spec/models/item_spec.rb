require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context "投稿が成功する場合" do
      it "全ての情報が正しく入力されていれば投稿できる" do
        expect(@item).to be_valid
      end
    end
    context "投稿が失敗する場合" do
      it "ログインしているユーザーだけが、出品ページへ遷移できること" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")

      end
      it "画像は1枚必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須であること" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が必須であること" do
        @item.discription = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Discription can't be blank")
      end
      it "カテゴリーの情報が必須であること" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category が選択されていません")
      end
      it "商品の状態についての情報が必須であること" do
        @item.status_id  = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status が選択されていません")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.shippingfee_id  = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingfee が選択されていません")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.prefecture_id  = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture が選択されていません")
      end
      it "発送までの日数についての情報が必須であること" do
        @item.shippingdate_id  = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shippingdate が選択されていません")
      end
      it "価格についての情報が必須であること" do
        @item.price  = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300未満では投稿できないこと" do
        @item.price  = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間としてください")
      end
      it "価格の範囲が、¥9,999,999超では投稿できないこと" do
        @item.price  = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999の間としてください")
      end
      it "販売価格は半角数字のみ保存可能であること（全角不可）" do
        @item.price  = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字を使用してください")
      end
      it "販売価格は半角数字のみ保存可能であること（文字不可）" do
        @item.price  = "こんにちは"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は半角数字を使用してください")
      end
    end
  end
end
