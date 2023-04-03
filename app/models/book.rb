class Book < ApplicationRecord
  
  validates :title, presence: true
  validates :opinion, presence: true, length: { maximum: 100 }
  
  belongs_to :user
  
  def get_user_image
    (user_image.attached?) ? user_image : 'no_image.jpg'
  end
end
