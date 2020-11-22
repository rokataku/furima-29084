class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def price
    price = Item.find(params[:price])
    fee = price * 0.1

    render json: { item: fee}
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :discription,
      :category_id,
      :status_id,
      :shippingfee_id,
      :prefecture_id,
      :shippingdate_id,
      :price,
      :user_id,
      :image
    )
    .merge(user_id: current_user.id)
  end

end
