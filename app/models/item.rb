class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one    :buyer
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :detail
    validates :category_id,      numericality: { other_than: 1 }
    validates :condition_id,     numericality: { other_than: 1 } 
    validates :delivery_fee_id,  numericality: { other_than: 1 } 
    validates :shipping_area_id, numericality: { other_than: 1 } 
    validates :shipping_day_id,  numericality: { other_than: 1 } 
    validates :price, numericality: { only_integer: true, message: "Half-width number"} 
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}
     
    validates :image
  end
end
