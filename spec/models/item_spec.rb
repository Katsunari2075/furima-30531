require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    it 'name,description,category_id,status_id,burden_id,area_id,day_to_ship_id,price,imageがあれば保存できること'do
      expect(@item).to be_valid
    end

    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'category_idが空では保存できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idが空では保存できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'burden_idが空では保存できないこと' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end

    it 'area_idが空では保存できないこと' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'day_to_ship_idが空では保存できないこと' do
      @item.day_to_ship_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Day to ship can't be blank")
    end

    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは半角数字であれば保存できること' do
      @item.price = '7777'
      expect(@item).to be_valid
    end

    it 'priceは半角数字でなければ保存できないこと' do
      @item.price = '７７７７'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceは300以上でないと保存できない' do
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than 299")
    end

    it 'priceは10000000未満出ないと保存できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than 10000000")
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end
