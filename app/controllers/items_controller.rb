class ItemsController < ApplicationController
  def index
    @items = Item.all 
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :delivery_fee_id, :shipping_area_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end