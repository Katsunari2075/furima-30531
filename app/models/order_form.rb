class OrderForm

  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :city, :address, :building, :tel, :token, :item_id, :user_id, :purchase_id

    with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{11}\z/ }
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Recipient.create(post_code: post_code, area_id: area_id, city: city, address: address, building: building, tel: tel, purchase_id: purchase.id)
  end
end