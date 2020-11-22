class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shippingdate

  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :discription
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category
    validates :status
    validates :shippingfee
    validates :prefecture
    validates :shippingdate
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください' } do
    validates :price
  end

  with_options inclusion: {in: 300..9999999 }, format: { message: 'は¥300~¥9,999,999の間で入力してください' } do
    validates :price
  end

end
