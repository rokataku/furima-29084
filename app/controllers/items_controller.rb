class ItemsController < ApplicationController

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
      render :new
    end
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
      :user_id
    )
  end

end
