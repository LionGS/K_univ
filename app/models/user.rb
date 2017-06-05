class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  #User에서 liked_posts를 가져오는데 이건 likes를 베이스로 가져오고
  #post인 애들만 보여준다
  
  def is_like?(post)
    Like.find_by(user_id: self.id, post_id: post.id).present?
  
  end
  
end
