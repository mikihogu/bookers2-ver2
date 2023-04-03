class Book < ApplicationRecord
  
  validates :title, presence: true
  validates :opinion, presence: true, length: { maximum: 100 }
  
end
