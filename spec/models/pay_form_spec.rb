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
      it 'addressが空では登録できない' do
        @pay_form.address = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'tokenが空では登録できない' do
        @pay_form.token = nil
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalcodeが空では登録できない' do
        @pay_form.postalcode = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postalcode can't be blank")
      end
      it 'postalcodeはhyphen(-)がないと登録できない' do
        @pay_form.postalcode = 1111111
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Postalcode is invalid. Include hyphen(-)")
      end
      it 'region_idが「---」では登録できない' do
        @pay_form.region_id = 1
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Region must be other than 1")
      end
      it 'phonenumberが空では登録できない' do
        @pay_form.phonenumber = ''
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber can't be blank")
      end
      it 'phonenumberが全角では登録できない' do
        @pay_form.phonenumber = '０９０１１１１１１１１'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが10文字では登録できない' do
        @pay_form.phonenumber = '0901111111'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが12文字では登録できない' do
        @pay_form.phonenumber = '090111111122'
        @pay_form.valid?
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it 'phonenumberが英語では登録できない' do
        @pay_form.phonenumber = 'aaaaaaaaaaa'
        @pay_form.valid?
        binding.pry
        expect(@pay_form.errors.full_messages).to include("Phonenumber is invalid")
      end
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @pay_form.@user.id = nil
        @pay_form.valid?
        binding.pry
        expect(@pay_form.errors.full_messages).to include("User must exist")
      end
    end
  end
end


