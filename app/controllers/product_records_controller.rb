class ProductRecordsController < ApplicationController
  def index
    @product_record = PayForm.new
    @item = Item.find(params[:item_id])
  end

 
  def create
    @item = Item.find(params[:item_id])
    @product_record = PayForm.new(product_record_params)
     if @product_record.valid?
      pay_item
      @product_record.save
       redirect_to root_path
     else
       render action: :index
     end
  end

  private
 def product_record_params
  params.require(:pay_form).permit(:postalcode, :region_id, :municipality, :address, :buildingname, :phonenumber).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: product_record_params[:token],
        currency: 'jpy'
      )
end
end
