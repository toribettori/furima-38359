class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
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
    params.require(:item).permit(:item_name, :category_id, :situation_id, :delivery_charge_id, :area_id, :delivery_date_id, :explanation, :price, :image).merge(user_id: current_user.id)
  end
    
end
