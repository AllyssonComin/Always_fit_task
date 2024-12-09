class User < ApplicationRecord
  has_many :tasks

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: "deve ser um endereço de email válido" }
end
