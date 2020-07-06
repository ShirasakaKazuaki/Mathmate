class Category < ApplicationRecord
  has_many :category_units, dependent: :destroy
  has_many :units, through: :category_units
  accepts_nested_attributes_for :category_units
end
