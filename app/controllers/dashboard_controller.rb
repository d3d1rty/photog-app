##
# = DashboardController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing the dashboard as well as
# any associated actions.
class DashboardController < ApplicationController
  before_action :require_login

  ##
  # GET /dashboard
  def show; end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end
end
