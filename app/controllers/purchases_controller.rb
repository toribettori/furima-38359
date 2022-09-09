class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :sold
  before_action :item_user

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :area_id, :municipality, :house_number, :building, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def sold
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def item_user
    redirect_to root_path if current_user.id == @item.user_id
  end
end
