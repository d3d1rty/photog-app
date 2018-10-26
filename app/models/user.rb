class User < ApplicationRecord
  include Clearance::User
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :business_name, presence: true, length: { maximum: 90 }
  validates :brand, presence: true, length: { maximum: 90 }
end
