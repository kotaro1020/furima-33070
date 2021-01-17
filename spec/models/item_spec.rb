require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it 'image、productnameとexplanation、category_id、productstate_id、deliveryfee_id、region_id、deliverydate_id、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品を出品できないとき' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'productnameが空では登録できない' do
        @item.productname = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Productname can't be blank")
      end
        it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idが「---」では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'productstate_idが「---」では登録できない' do
        @item.productstate_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Productstate is not a number")
      end
      it 'deliveryfee_idが「---」では登録できない' do
        @item.deliveryfee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliveryfee is not a number")
      end
      it 'region_idが「---」では登録できない' do
        @item.region_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Region is not a number")
      end
      it 'deliverydate_idが「---」では登録できない' do
        @item.deliverydate_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Deliverydate is not a number")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが全角数字では登録できない' do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

