require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    describe '商品を購入する' do
      context '商品を購入できる場合' do
        it 'トークン、郵便番号、都道府県、市町村、番地、電話番号があれば商品が購入できる' do
          expect(@order_address).to be_valid
        end
      end

      context '商品を出品できない場合' do
        it 'tokenが空では商品購入ができない' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end

        it 'postal_codeが空では商品購入ができない' do
          @order_address.postal_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeが全角では商品購入ができない' do
          @order_address.postal_code = '１１１−１１１１'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code is invalid')
        end

        it 'postal_codeにハイフンがない場合商品購入ができない' do
          @order_address.postal_code = '1112222'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code is invalid')
        end

        it 'postal_codeが（3桁半角数字 ハイフン 4桁半角数字)の形でない場合商品購入ができない' do
          @order_address.postal_code = '1112-222'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code is invalid')
        end

        it 'prefecture_idが空では商品購入ができない' do
          @order_address.prefecture_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end

        it 'prefecture_idが0では商品購入ができない' do
          @order_address.prefecture_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
        end

        it 'cityが空では商品購入ができない' do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end

        it 'addressが空では商品購入ができない' do
          @order_address.address = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numberが空では商品購入ができない' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'phone_numberが全角では商品購入ができない' do
          @order_address.phone_number = '０９０１１１１２２２２'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end

        it 'phone_numberにハイフンが含まれる場合商品購入ができない' do
          @order_address.phone_number = '090-1111-2222'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end

        it 'phone_numberが10桁未満の場合商品購入ができない' do
          @order_address.phone_number = '090111222'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end
        it 'phone_numberが12桁以上の場合商品購入ができない' do
          @order_address.phone_number = '090111122222'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is invalid')
        end

        it 'item_idが空では商品購入ができない' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end

        it 'user_idが空では商品購入ができない' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
      end
    end
  end
end
