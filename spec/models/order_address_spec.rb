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


    end
  end
end
