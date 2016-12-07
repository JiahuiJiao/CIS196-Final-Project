# Required for password hash
require 'bcrypt'

# Create user table
class User < ActiveRecord::Base
  include BCrypt

  has_many :events, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :users_friends
  has_many :friends, through: :users_friends

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 2 }
  validates :name, length: { maximum: 50 }

  validates :email, presence: true
  validates :email, length: { minimum: 2 }
  validates :email, length: { maximum: 50 }

  validates :password, presence: true
  validates :password, presence: { minimum: 2 }
  validates :password, presence: { maximum: 20 }

  def password
    @password ||= Password.new(password_hash) unless password_hash.nil?
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
