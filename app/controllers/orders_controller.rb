class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if !@item.purchase.nil?
    @order_form = OrderForm.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def new
    @order_form = OrderForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:post_code, :area_id, :city, :address, :building, :tel, :token, :purchase_id, :user_id, :item_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
