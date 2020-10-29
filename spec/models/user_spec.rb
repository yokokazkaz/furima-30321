require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nameとemail、passwordとpassword_confirmation、last_nameとfirst_name、read_last_nameとread_first_name、birth-dateが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
    end

    it "emailが空では登録できないこと" do
    end

    it "passwordが空では登録できないこと" do
    end

    it "last_nameが空では登録できないこと" do
    end

    it "first_nameが空では登録できないこと" do
    end

    it "read_last_nameが空では登録できないこと" do
    end

    it "read_first_nameが空では登録できないこと" do
    end
  
    it "birth_dateが空では登録できないこと" do
    end
  
    it "emailが@を含めば登録できること" do
    end

    it "emailが@を含まなければ登録できないこと" do
    end

    it "passwordが半角英数字を含んだ6文字以上であれば登録できること" do
    end

    it "passwordが5文字以下であれば登録できないこと" do
    end

    it "passwordが全角であれば登録できないこと" do
    end
    
    it "passwordが半角数字のみであれば登録できないこと" do
    end
    
    it "passwordが半角英字のみであれば登録できないこと" do
    end
    
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
    end

    it "last_nameが全角であれば登録できること" do
    end

    it "last_nameが半角であれば登録できないこと" do
    end

    it "first_nameが全角であれば登録できること" do
    end

    it "first_nameが半角であれば登録できないこと" do
    end

    it "read_last_nameが全角カタカナであれば登録できること" do
    end

    it "read_last_nameが半角であれば登録できないこと" do
    end

    it "read_last_nameが全角漢字であれば登録できないこと" do
    end

    it "read_last_nameが全角ひらがなであれば登録できないこと" do
    end

    it "read_first_nameが全角カタカナであれば登録できること" do
    end

    it "read_first_nameが半角であれば登録できないこと" do
    end

    it "read_first_nameが全角漢字であれば登録できないこと" do
    end

    it "read_first_nameが全角ひらがなであれば登録できないこと" do
    end

    it "重複したemailが存在する場合登録できないこと" do

    end
    
  end
end
