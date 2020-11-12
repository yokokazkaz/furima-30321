class ItemsController < ApplicationController
  # before_action :item_find
  before_action :authenticate_user!, only: :index
  before_action :move_to_index

  def index
    @items = Item.all.order('created_at DESC').includes(:user)
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :condition_id, :delivery_fee_id, :shipping_area_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path 
    end
  end

  # def item_find
  #   @item = Item.find(params[:id])
  # end

end
