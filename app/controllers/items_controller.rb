class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :item_find, only: [:edit, :update, :show]

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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end
   
  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :situation_id, :delivery_charge_id, :area_id, :delivery_date_id, :explanation, :price, :image).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end  
    
end
