##
# = Booking
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides validations and methods for the booking model.
class Booking < ApplicationRecord
  belongs_to :client

  validates :name, presence: true
  validates :start_time, presence: true
  validates :client_id, presence: true
end
