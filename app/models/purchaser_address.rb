class PurchaserAddress # < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_source_id, :city, :street_address, :building_name, :phone_number, :item_id, :user_id,
                :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :street_address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  validates :shipping_source_id, numericality: { other_than: 1, message: "must be selected" }

  def save
    purchase = Purchase.create(item_id:, user_id:)
    Address.create(postal_code:, shipping_source_id:, city:, street_address:,
                   building_name:, phone_number:, purchase_id: purchase.id)
  end
end
