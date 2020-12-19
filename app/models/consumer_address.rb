class ConsumerAddress
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phonenumber, :user_id, :item_id, :token  

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phonenumber, length: { maximum: 11, message: "is out of setting range"}
    validates :city
    validates :house_number
    validates :token
  end

  def save
    consumer = Consumer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phonenumber: phonenumber, consumer_id: consumer.id)
  end
end