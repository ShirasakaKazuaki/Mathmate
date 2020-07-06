class Post < ApplicationRecord
  has_many :post_units, dependent: :destroy
  has_many :units, through: :post_units
  accepts_nested_attributes_for :post_units, allow_destroy: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  has_many :responses, dependent: :destroy
  has_many :stocks, dependent: :destroy
  mount_uploader :qimg, QimgUploader
  mount_uploader :aimg, AimgUploader

  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :units, presence: true

  def self.search(search, ids)
    return Post.all if search.blank? && ids.blank?
    return Post.includes(:units).where("units.id": ids).references(:units) if search.blank? && ids.present?

    if search.present? && ids.blank?
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.where(['title LIKE ?', "%#{search}%"]).includes(:units).where("units.id": ids).references(:units)
    end
  end
end
