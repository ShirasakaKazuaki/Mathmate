class Reply < ApplicationRecord
  belongs_to :response
  belongs_to :user

  validates :content, presence: true
end
