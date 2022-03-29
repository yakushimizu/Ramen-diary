class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :image, presence: true, blob: { content_type: :image }
  validates :shop_name, presence: true
  validates :address, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def Item.search(search) 
    if search
      where(['address LIKE ?', "%#{search}%"]) #検索とaddressの部分一致を表示。
    else
      all #全て表示させる
    end
  end

end
