class CategoryUnit < ApplicationRecord
  belongs_to :unit
  belongs_to :category
end
