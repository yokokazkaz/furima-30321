require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品を出品する' do
      context '商品を出品できる場合' do
        it '商品画像、商品名、商品説明、商品カテゴリー、商品の状態、配送料の負担、発送元地域、発送までの日数、販売価格があれば商品が出品できる' do
          expect(@item).to be_valid
        end
      end

      context '商品を出品できない場合' do
        it 'imageが空の場合商品を出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空の場合商品を出品できない' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'detailが空の場合商品を出品できない' do
          @item.detail = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Detail can't be blank")
        end

        it 'category_idが空の場合商品を出品できない' do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", 'Category is not a number')
        end

        it 'condition_idが空の場合商品を出品できない' do
          @item.condition_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Condition can't be blank", 'Condition is not a number')
        end

        it 'delivery_fee_idが空の場合商品を出品できない' do
          @item.delivery_fee_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank", 'Delivery fee is not a number')
        end

        it 'shipping_area_idが空の場合商品を出品できない' do
          @item.shipping_area_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping area can't be blank", 'Shipping area is not a number')
        end

        it 'shipping_day_idが空の場合商品を出品できない' do
          @item.shipping_day_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day can't be blank", 'Shipping day is not a number')
        end

        it 'category_idが1の場合商品を出品できない' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category must be other than 1')
        end

        it 'condition_idが1の場合商品を出品できない' do
          @item.condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Condition must be other than 1')
        end

        it 'delivery_fee_idが1の場合商品を出品できない' do
          @item.delivery_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
        end

        it 'shipping_area_idが1の場合商品を出品できない' do
          @item.shipping_area_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
        end

        it 'shipping_day_idが1の場合商品を出品できない' do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
        end

        it 'priceが空の場合商品を出品できない' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it 'priceが全角の場合商品を出品できない' do
          @item.price = '４０００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
        end

        it 'priceが半角英字の場合商品を出品できない' do
          @item.price = 'sanbyaku'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Half-width number', 'Price Out of setting range')
        end

        it 'priceが300円未満の場合商品を出品できない' do
          @item.price = 200
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end

        it 'priceが9,999,999円以上の場合商品を出品できない' do
          @item.price = 999_999_999
          @item.valid?
          expect(@item.errors.full_messages).to include('Price Out of setting range')
        end
      end
    end
  end
end
