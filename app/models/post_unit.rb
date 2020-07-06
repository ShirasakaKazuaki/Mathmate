class PostUnit < ApplicationRecord
  belongs_to :post, optional: true
  belongs_to :unit, optional: true
end
