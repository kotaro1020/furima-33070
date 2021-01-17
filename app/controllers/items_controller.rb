class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @items = Item.all.order(created_at: :DESC)
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
    params.require(:item).permit(:image,:productname,:explanation,:category_id,:productstate_id,:deliveryfee_id,:region_id,:deliverydate_id,:price).merge(user_id: current_user.id)
  end
end