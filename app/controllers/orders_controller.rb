class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    item_find
    @order_address = OrderAddress.new
  end

  def create
    item_find
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :apartment_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    item_find
    redirect_to root_path unless user_signed_in? && current_user.id != @item.user_id && @item.order.blank?
  end
end
