class ConsumersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]


  def index
    @consumer_address = ConsumerAddress.new
  end

  def create
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
  def set_item
    @item = Item.find(params[:item_id])
  end

  def consumer_params
    params.require(:consumer_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phonenumber).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.consumer != nil
      redirect_to root_path
    end
  end

end