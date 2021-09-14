class Post < ApplicationRecord
    
    attachment :post_image
    
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
   
   def liked_by?(user)
    likes.where(user_id: user.id).exists?
   end
    
end
