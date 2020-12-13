class ConsumersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_consumer, only: [:index]
  before_action :move_to_index, only: [:index]


  def index
    item = Item.find(params[:item_id])
    @name = item.name
    @price = item.price
    @consumer_address = ConsumerAddress.new
  end

  def create
    item = Item.find(params[:item_id])
    @price = item.price
    @consumer_address = ConsumerAddress.new(consumer_params)
    if @consumer_address.valid?
      pay_item
      @consumer_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def consumer_params
    params.require(:consumer_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phonenumber).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    item = Item.find(params[:item_id]) 
    if current_user.id == item.user_id
      redirect_to root_path
    end
  end

  def correct_consumer
    item = Item.find(params[:item_id]) 
    unless current_user.id == item.user_id
      redirect_to root_path
    end
  end

end