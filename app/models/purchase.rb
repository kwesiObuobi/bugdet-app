class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories_purchases, dependent: :destroy, class_name: 'CategoriesPurchases'
  has_many :categories, through: :categories_purchases, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
