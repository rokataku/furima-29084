class Consumer < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :address
  has_one_attached :image
end
