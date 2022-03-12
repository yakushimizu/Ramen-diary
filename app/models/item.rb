class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :item_comments, dependent: :destroy

  validates :image, presence: true, blob: { content_type: :image }
end
