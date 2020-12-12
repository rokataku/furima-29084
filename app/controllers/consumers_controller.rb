class ConsumersController < ApplicationController

  def index
    item = Item.find(params[:item_id])
    @name = item.name
    @price = item.price
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
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phonenumber, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_81eb94ce86f8e734eb156c24"
    Payjp::Charge.create(
      amount: @price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end
