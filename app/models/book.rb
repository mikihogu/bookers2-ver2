class Book < ApplicationRecord
  
  validates :title, presence: true
  validates :opinion, presence: true, length: { maximum: 200 }
  
  belongs_to :user
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
