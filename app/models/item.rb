class Item < ApplicationRecord
  belongs_to :user
  has_one    :buyer
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_area_id
    validates :shipping_days_id
    validates :price #半角数字限定、¥300~¥9,999,999の間制限
    validates :image
  end
end
