class Recipient < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :post_code
    validates :area_id
    validates :city
    validates :address
    validates :tel
  end
  
  validates :area_id, numericality: { other_than: 1 }
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :tel, format: { with: /\A\d{11}\z/ }
end
