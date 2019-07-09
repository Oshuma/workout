class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :rememberable, :validatable

  has_many :routine_types, dependent: :destroy
  has_many :workouts, dependent: :destroy
end
