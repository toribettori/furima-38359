class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :house_number, :building, :phone, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :house_number
    validates :phone, format: {with: /\A[0-9]{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  validates :area_id, numericality: {other_than: 1, message: "can't be blank"}

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(post_code: post_code, area_id: area_id, municipality: municipality, house_number: house_number, building: building, phone: phone, purchase_id: purchase.id)
  end

end  