class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_purchases, dependent: :destroy, class_name: 'CategoriesPurchases'

  validates :name, :icon, presence: true
end
