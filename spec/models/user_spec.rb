require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスは@を含む必要があること' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email メールアドレスは@を含む必要があります')
      end

      it 'パスワードが必須であること' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'メールアドレスが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'パスワードは6文字以上であること' do
        @user.password = 'aaa1'
        @user.password_confirmation = 'aaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードは半角英数字混合であること（全角は不可）' do
        @user.password = 'ＡＡＡ１１１'
        @user.password_confirmation = 'ＡＡＡ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合を使用してください')
      end

      it 'パスワードは半角英数字混合であること（英字のみは不可）' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合を使用してください')
      end

      it 'パスワードは半角英数字混合であること（数字のみは不可）' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合を使用してください')
      end

      it 'パスワードは確認用を含めて2回入力すること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名が、名前が必須であること' do
        @user.kanjifirstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanjifirstname can't be blank")
      end

      it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.kanjifamilyname = 'james'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanjifamilyname 全角（漢字・ひらがな・カタカナ）を使用してください')
      end

      it 'ユーザー名前は全角（漢字・ひらがな・カタカナ）で入力させること' do
        @user.kanjifirstname = 'bond'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanjifirstname 全角（漢字・ひらがな・カタカナ）を使用してください')
      end

      it 'ユーザー本名が、名字が必須であること' do
        @user.kanjifamilyname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanjifamilyname can't be blank")
      end

      it 'ユーザー本名のフリガナ本名が必須であること' do
        @user.kanafamilyname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanafamilyname 全角（カタカナ）を使用してください')
      end

      it 'ユーザー本名のフリガナ名前が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角（カタカナ）を使用してください')
      end

      it 'ユーザー名字のフリガナは全角（カタカナ）で入力させること' do
        @user.kanafamilyname = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kanafamilyname 全角（カタカナ）を使用してください')
      end

      it 'ユーザー名前のフリガナは全角（カタカナ）で入力させること' do
        @user.first_name_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角（カタカナ）を使用してください')
      end

      it '生年月日が必須であること' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
