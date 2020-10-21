class Purchase < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :recipient
  has_one_attached :image

  validates :image, presence: true
end
