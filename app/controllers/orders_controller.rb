class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]
  before_action :set_item, only: [:index, :create]
  before_action :set_order_form, only: [:index, :new]
  before_action :purchase_root_path, only: :index
  before_action :self_item_root_path, only: :index

  def index
  end

  def new
  end

  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_order_form
    @order_form = OrderForm.new
  end

  def purchase_root_path
    redirect_to root_path if !@item.purchase.nil?
  end

  def self_item_root_path
    redirect_to root_path if current_user.id == @item.user_id
  end
end
