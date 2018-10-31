##
# = BookingPackage
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides validations and methods for the booking package model.
class BookingPackage < ApplicationRecord
  belongs_to :booking

  validates :name, presence: true
  validates :duration, presence: true
  validates :retainer_fee, presence: true
  validates :total_cost, presence: true
end
