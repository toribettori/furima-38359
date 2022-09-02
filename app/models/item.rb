class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :delivery_charge
  belongs_to :delivery_date
  belongs_to :situation 
  has_one_attached :image
end
