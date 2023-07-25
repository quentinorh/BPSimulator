class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :user_lists
  has_many :lists
  has_many :lists, through: :user_lists
  has_many :owned_lists, class_name: 'List'
end
