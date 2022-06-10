class Item < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true, uniqueness: { case_sensitive: false },
   length: {minimum: 3,maximum: 50}
    
end
