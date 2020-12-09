class User < ApplicationRecord
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable, :registerable, :validatable

  has_many :comments
  enum status: { qualified: 0, not_qualified: 1, banned: 2 }

  before_create :my_method

  def my_method
      self.skip_confirmation!
      self.confirm
  end
end
