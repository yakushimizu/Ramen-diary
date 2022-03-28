class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :image, presence: true, blob: { content_type: :image }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def Item.search(search) #self.はItem.を意味する
    if search
      where(['address LIKE ?', "%#{search}%"]) #検索とadressの部分一致を表示。
    else
      all #全て表示させる
    end
  end

end
