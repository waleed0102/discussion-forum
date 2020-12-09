class User < ApplicationRecord
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  devise :database_authenticatable, :registerable, :validatable

  has_many :comments
  enum status: [:qualified, :not_qualified, :banned ]

  before_create :skip_confirmation_process

  def skip_confirmation_process
    self.skip_confirmation!
    self.confirm
  end
end
