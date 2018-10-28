##
# = PackageGroup
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides validations and methods for the package groups model.
#
# Package group and package resources share a nested, one-to-many relationship.
class PackageGroup < ApplicationRecord
  has_many :packages
  validates :name, presence: true, length: { maximum: 75 }
end
