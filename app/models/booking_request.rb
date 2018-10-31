##
# = BookingRequest
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions
# License::   GNU Public License 3
#
# This controller provides validations and methods for the booking request model.
class BookingRequest < ApplicationRecord
  belongs_to :package

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :requested_date, presence: true
end
