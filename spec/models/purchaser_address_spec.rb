require 'rails_helper'

RSpec.describe PurchaserAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchaser_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報' do
    context '購入ができる時' do
      it '必要な情報を入れて購入できる' do
        expect(@purchase_address).to be_valid
      end

      it '建物名が空でも保存できる' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end

      it 'priceとtokenがあれば保存ができること' do
        expect(@purchase_address).to be_valid
      end
    end

    context '購入ができない場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列でない場合、保存できないこと' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空だと保存できないこと' do
        @purchase_address.shipping_source_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping source must be selected")
      end

      it 'shipping_source_idが1の場合は無効であること' do
        @purchase_address.shipping_source_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Shipping source must be selected") 
      end

      it '市区町村が空だと保存できないこと' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと保存できないこと' do
        @purchase_address.street_address = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号にハイフンがある場合、保存できないこと' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号に英字が含まれる場合、保存できないこと' do
        @purchase_address.phone_number = '090abcdefg'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が空だと保存できないこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁未満の場合、保存できないこと' do
        @purchase_address.phone_number = '090123456'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が11桁を超える場合、保存できないこと' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'tokenが空では登録できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
