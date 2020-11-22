class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shippingfee
  belongs_to :prefecture
  belongs_to :shippingdate

  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :name
    validates :discription
    validates :image
  end

  with_options numericality: { other_than: 1, message: 'が選択されていません' } do
    validates :category_id
    validates :status_id
    validates :shippingfee_id
    validates :prefecture_id
    validates :shippingdate_id
  end

  with_options numericality: { greater_than_or_equal_to: 300, message: 'は¥300~¥9,999,999の間としてください' } do
    validates :price
  end

  with_options numericality: { less_than_or_equal_to: 9999999, message: 'は¥300~¥9,999,999の間としてください' } do
    validates :price
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'は半角数字を使用してください' } do
    validates :price
  end

end
