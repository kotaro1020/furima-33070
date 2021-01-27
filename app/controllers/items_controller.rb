class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :edit]
  before_action :contributor_confirmation, only: [:edit]
  
  def index
    @items = Item.includes(:user).order(created_at: :DESC)
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
    redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy && current_user.id == @item.user.id
      redirect_to root_path 
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:productname,:explanation,:category_id,:productstate_id,:deliveryfee_id,:region_id,:deliverydate_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user || current_user != @item.user
  end
end