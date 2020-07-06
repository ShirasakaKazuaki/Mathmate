class Unit < ApplicationRecord
  has_many :category_units, dependent: :destroy
  has_many :categories, through: :category_units

  has_many :post_units, dependent: :destroy
  has_many :posts, through: :post_units
end
