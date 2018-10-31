##
# = BookingsRequestsController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions
# License::   GNU Public License 3
#
# This controller provides methods for accessing booking requests resources.
class BookingRequestsController < ApplicationController
  before_action :require_login, only: %i[edit update destroy]
  before_action :set_booking_request, only: %i[show edit update destroy]

  ##
  # GET /booking_requests/new
  def new
    @booking_request = BookingRequest.new
  end

  ##
  # GET /booking_requests/:booking_request_id
  def show; end

  ##
  # GET /booking_requests/:booking_request_id/edit
  def edit; end

  ##
  # POST /booking_requests
  #
  # POST /booking_requests.json
  def create
    @booking_request = BookingRequest.create(booking_request_params)

    respond_to do |format|
      if @booking_request.save
        flash[:type] = 'success'
        flash[:message] = 'Your booking request has been submitted. We will reach out to you to confirm the booking soon.'
        format.html { redirect_to booking_request_path(@booking_request) }
        format.json { render :show, status: :created, location: booking_request_path(@booking_request) }
      else
        @errors = @booking_request.errors.full_messages
        format.html { render :new }
        format.json { render json: @booking_request.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /booking_requests/:booking_request_id
  #
  # PATCH/PUT /booking_requests/:booking_request_id.json
  def update
    respond_to do |format|
      if @booking_request.update(booking_request_params)
        flash[:type] = 'success'
        flash[:message] = 'Booking request was successfully updated.'
        format.html { redirect_to booking_request_path(@booking_request) }
        format.json { render :show, status: :ok, location: booking_request_path(@booking_request) }
      else
        @errors = @booking_request.errors.full_messages
        format.html { render :edit }
        format.json { render json: @booking_request.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # DELETE /booking_requests/:booking_request_id
  #
  # DELETE /booking_requests/:booking_request_id.json
  def destroy
    @booking_request.destroy
    respond_to do |format|
      flash[:type] = 'success'
      flash[:message] = 'Booking request was successfully deleted.'
      format.html { redirect_to dashboard_path }
      format.json { head :no_content }
    end
  end

  private

  ##
  # Sets booking_request for individual resource actions
  def set_booking_request
    @booking_request = BookingRequest.find(params[:id])
  end

  ##
  # Whitelists parameters
  def booking_request_params
    params.require(:booking_request).permit(:first_name, :last_name, :email, :phone_number, :requested_date, :package_id)
  end
end
