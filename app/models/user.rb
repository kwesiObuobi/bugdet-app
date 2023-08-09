class User < ApplicationRecord
  has_many :categories, dependent: :destroy, foreign_key: :author_id
  has_many :purchases, dependent: :destroy, foreign_key: :author_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
end
