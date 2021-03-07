class User < ApplicationRecord
    # encrypt password
    has_secure_password

    # Model associations
    has_one :student, foreign_key: :user_id
    has_one :mentor, foreign_key: :user_id
    has_one :staff, foreign_key: :user_id
  # Validations
    # validates :role, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates_presence_of :password_digest
end