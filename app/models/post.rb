class Post < ApplicationRecord
  validates :shop_name, { presence: true }
  validates :area_name, { presence: true }
  validates :comment, { presence: true, length: { maximum: 140 } }
  validates :shop_category, { presence: true }
  validates :product_category, { presence: true }
end
