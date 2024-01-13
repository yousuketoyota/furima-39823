require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品作成' do
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'image:必須' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'title:必須' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'explanation:必須' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'price:必須' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'price:半角数字' do
        @item.price = '１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'price:範囲指定（小）' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'price:範囲指定（大）' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'category_id:1以外' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be selected")
      end

      it 'condition_id:1以外' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be selected")
      end

      it 'shipping_fee_id:1以外' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee must be selected")
      end

      it 'shipping_source_id:1以外' do
        @item.shipping_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping source must be selected")
      end

      it 'shipping_schedule_id:1以外' do
        @item.shipping_schedule_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping schedule must be selected")
      end

      it 'user:必須' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
