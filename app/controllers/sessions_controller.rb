##
# = SessionsController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller overrides default Clearance behavior for sessions
class SessionsController < Clearance::SessionsController
  ##
  # GET /session/new
  def new
    @page_title = 'Sign In'
    render layout: 'landing'
  end

  ##
  # GET /sign_in
  def create
    @user = authenticate(params)

    sign_in(@user) do |status|
      if status.success?
        redirect_to dashboard_path
      else
        flash[:message] = status.failure_message
        flash[:type] = 'danger'
        redirect_to sign_in_path
      end
    end
  end

  private

  ##
  # Overrides default clearance behavior
  def redirect_signed_in_users
    redirect_to url_for_signed_in_users if signed_in?
  end

  ##
  # Overrides default clearance behavior
  def url_after_create
    dashboard_path
  end

  ##
  # Overrides default clearance behavior
  def url_after_destroy
    sign_in_url
  end

  ##
  # Overrides default clearance behavior
  def url_for_signed_in_users
    url_after_create
  end
end
