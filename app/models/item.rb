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
    validates :price, numericality: { only_integer: true, message: 'Half-width number' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :image
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_fee_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
  end
end
