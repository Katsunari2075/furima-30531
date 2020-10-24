require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      @order_form = FactoryBot.build(:order_form)
    end

    it '全ての値が正しく入力されていれば保存できるということ' do
      expect(@order_form).to be_valid
    end

    it 'buildingは空でも保存できるということ' do
      @order_form.building = nil
      expect(@order_form).to be_valid
    end

    


    it 'tokenが空では保存できないということ' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'post_codeが空では保存できないということ' do
      @order_form.post_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeは半角のハイフンを含む正しい形式でないと保存できないこと' do
      @order_form.post_code = "0000000"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Post code is invalid")
    end

    it 'area_idが空では保存できないということ' do
      @order_form.area_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Area can't be blank")
    end

    it 'area_idの値が１では保存できないということ' do
      @order_form.area_id = 1
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Area must be other than 1")
    end

    it 'cityが空では保存できないということ' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では保存できないということ' do
      @order_form.address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")
    end

    it 'telが空では保存できないということ' do
      @order_form.tel = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Tel can't be blank")
    end

    it 'telは半角のハイフンなしで11桁以内でないと保存できないこと' do
      @order_form.tel = "000-0000-0000"
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Tel is invalid")
    end
  end
end
