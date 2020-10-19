class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :day_to_ship

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_to_ship_id
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_to_ship_id
  end

  with_options format: { with: /\A[0-9]+\z/} do
    validates :price
  end
  validates :price, numericality: { greater_than: 299 }
  validates :price, numericality: { less_than: 10000000 }
end
