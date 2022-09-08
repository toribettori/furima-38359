class PurchasesController < ApplicationController
  before_action :sold

  def index
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end 
  end
  
  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :area_id, :municipality, :house_number, :building, :phone, :purchase_id).merge(user_id: current_user.id, item_id: @item.id)
  end

  def sold
    @item = Item.find(params[:item_id])
  end


end
