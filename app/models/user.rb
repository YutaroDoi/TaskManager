# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks, dependent: :destroy

  before_save :downcase_email
  before_destroy :at_least_one_admin_user_exists?

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  validates :password, length: { minimum: 6 }, presence: true, on: :create

  private

  def downcase_email
    email.downcase!
  end

  def at_least_one_admin_user_exists?
    throw :abort if User.where('admin = true').count < 2
  end
end
