class ConsumersController < ApplicationController
  def index
  end

  def new
  end

  def create
    binding.pry
    Address.create(address_params)
    Consumer.create(consumer_params)
    redirect_to action: :index
  end

  private

  def address_params
    params.prermit(:postal_code, :prefecture, :city, :house_number, :building_name, :phonenumber).merge(item_id: current_item.id)
  end

  def consumer_params
    params.merge(item_id: current_item.id)
  end

end
