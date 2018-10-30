##
# = ClientsController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions
# License::   GNU Public License 3
#
# This controller provides methods for accessing client resources.
class ClientsController < ApplicationController
  before_action :require_login
  before_action :set_client, only: %i[show edit update destroy]

  ##
  # GET /clients
  #
  # GET /clients.json
  def index
    @clients = if params[:search]
                 Client.search(params[:search]).order('created_at DESC')
               else
                 Client.all
               end
  end

  ##
  # GET /clients/:client_id
  #
  # GET /clients/:client_id.json
  def show; end

  ##
  # GET /clients/new
  def new
    @client = Client.new
  end

  ##
  # GET /clients/:client_id/edit
  def edit; end

  ##
  # POST /clients
  #
  # POST /clients.json
  def create
    @client = Client.create(client_params)

    respond_to do |format|
      if @client.save
        flash[:type] = 'success'
        flash[:message] = 'Client was successfully created.'
        format.html { redirect_to client_path(@client) }
        format.json { render :show, status: :created, location: client_path(@client) }
      else
        @errors = @client.errors.full_messages
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /clients/:client_id
  #
  # PATCH/PUT /clients/:client_id.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        flash[:type] = 'success'
        flash[:message] = 'Client was successfully updated.'
        format.html { redirect_to client_path(@client) }
        format.json { render :show, status: :ok, location: client_path(@client) }
      else
        @errors = @client.errors.full_messages
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # DELETE /clients/:client_id
  #
  # DELETE /clients/:client_id.json
  def destroy
    @client.destroy
    respond_to do |format|
      flash[:type] = 'success'
      flash[:message] = 'Client was successfully deleted.'
      format.html { redirect_to clients_path }
      format.json { head :no_content }
    end
  end

  private

  ##
  # Sets client for individual resource actions
  def set_client
    @client = Client.find(params[:id])
  end

  ##
  # Whitelists parameters
  def client_params
    params.require(:client).permit(:first_name, :last_name, :email, :phone_number, :search)
  end
end
