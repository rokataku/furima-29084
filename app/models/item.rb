class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shippingdate

  with_options presence: true do
    validates :name
    validates :discription
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category
    validates :status
    validates :shippingfee
    validates :prefecture
    validates :shippingdate
  end

  belongs_to :user
end
