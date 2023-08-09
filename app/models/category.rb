class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_purchases, dependent: :destroy, class_name: 'CategoriesPurchases'
  has_many :purchases, through: :categories_purchases, dependent: :destroy

  validates :name, :icon, presence: true
end
