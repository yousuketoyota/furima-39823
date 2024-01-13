class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_schedule
  belongs_to :shipping_source
  belongs_to :user

  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A\d+\z/ }
  end

  with_options numericality: { other_than: 1, message: 'must be selected' } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :shipping_schedule_id
    validates :shipping_source_id
  end
end
