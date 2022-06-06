class Item < ApplicationRecord
  belongs_to :user
  validates :name, :description, presence: true
  
end