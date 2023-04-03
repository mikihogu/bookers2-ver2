class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true
  
  has_many :books
  has_one_attached :user_image
  
  def get_user_image
    (user_image.attached?) ? user_image : 'no_image.jpg'
  end
  
end
