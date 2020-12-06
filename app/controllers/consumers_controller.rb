class ConsumersController < ApplicationController
  def index
    
  end

  def new
    @consumer_address = ConsumerAddress.new
  end

  def create
    @consumer_address = ConsumerAddress.new(consumer_params)
      if @consumer_address.valid?
        @consumer_address.save
        redirect_to root_path
      else
        render action: :index
      end
  end

  private

  def consumer_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phonenumber, :item_id).merge(user_id: current_user.id)
  end

end
