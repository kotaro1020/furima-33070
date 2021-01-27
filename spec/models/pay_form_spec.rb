require 'rails_helper'

RSpec.describe PayForm, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @pay_form = FactoryBot.build(:pay_form, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入機能' do
    context '商品を購入できるとき' do
      it 'postalcode、region_id、municipality、address、phonenumber、tokenが存在すれば購入できる' do
        expect(@pay_form).to be_valid
      end
    end
    context '商品を購入できないとき' do
      it 'municipalityが空では購入できない' do
        @pay_form.municipality = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では購入できない' do
        @pay_form.address = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'tokenが空では購入できない' do
        @pay_form.token = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalcodeが空では購入できない' do
        @pay_form.postalcode = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postalcode can't be blank")
      end
      it 'postalcodeはhyphen(-)がないと購入できない' do
        @pay_form.postalcode = 1111111
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      it 'region_idが「---」では購入できない' do
        @pay_form.region_id = 1
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Region must be other than 1")
      end
      it 'phonenumberが空では購入できない' do
        @pay_form.phonenumber = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'phonenumberにhyphen(-)があると購入できない' do
        @pay_form.phonenumber = '090-1111-1111'
        @pay_form.valid?
        binding.pry
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが全角では購入できない' do
        @pay_form.phonenumber = '０９０１１１１１１１１'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが12文字では購入できない' do
        @pay_form.phonenumber = '090111111122'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが英語では購入できない' do
        @pay_form.phonenumber = 'aaaaaaaaaaa'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it "ユーザーが紐付いていないと購入できない" do
        @pay_form.user_id = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("User can't be blank")
      end
      it "商品が紐付いていないと購入できない" do
        @pay_form.item_id = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end


