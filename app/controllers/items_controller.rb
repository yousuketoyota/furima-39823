class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
before_action :select_item, only: [:show]
  
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new,  status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :shipping_fee_id, :shipping_source_id, :shipping_schedule_id, :price, :image).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end

end  