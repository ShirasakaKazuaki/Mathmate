class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count
  validates :post_id, uniqueness: { scope: :user_id }
end
