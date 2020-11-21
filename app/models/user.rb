class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  with_options presence: true do
    validates :nickname
    validates :birthday
  end

  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'は半角英数字混合を使用してください' } do
    validates :password
  end

  with_options presence: true, format: { with: /@/, message: 'メールアドレスは@を含む必要があります' } do
    validates :email
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）を使用してください' } do
    validates :kanjifirstname
    validates :kanjifamilyname
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角（カタカナ）を使用してください' } do
    validates :first_name_kana
    validates :kanafamilyname
  end

end
