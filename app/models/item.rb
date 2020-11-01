class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
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
    validates :category_id,      numericality: { other_than: 1 } 
    validates :condition_id,     numericality: { other_than: 1 } 
    validates :delivery_fee_id,  numericality: { other_than: 1 } 
    validates :shipping_area_id, numericality: { other_than: 1 } 
    validates :shipping_days_id, numericality: { other_than: 1 } 
    validates :price #半角数字限定、¥300~¥9,999,999の間制限
    validates :image
  end
end
