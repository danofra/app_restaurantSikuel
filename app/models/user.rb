class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :ingredients, dependent: :destroy
  has_many :dishes, dependent: :destroy
  has_many :tables, dependent: :destroy
  has_many :orders, dependent: :destroy
end
