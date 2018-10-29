##
# = PackagesController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing package resources.
#
# Packages belong to one package group.
class PackagesController < ApplicationController
  before_action :require_login
  before_action :set_package, only: %i[show edit update destroy]
  before_action :set_package_group, only: %i[show create new edit update]

  ##
  # GET /package_groups/:package_group_id/packages/:package_id
  def show; end

  ##
  # GET /package_groups/:package_group_id/packages/new
  def new
    @package = @package_group.packages.new
  end

  ##
  # GET /package_groups/:package_group_id/packages/:package_id/edit
  def edit; end

  ##
  # POST /package_groups/:package_group_id/packages
  #
  # POST /package_groups/:package_group_id/packages.json
  def create
    @package = @package_group.packages.create(package_params)

    respond_to do |format|
      if @package.save
        flash[:type] = 'success'
        flash[:message] = 'Package was successfully created.'
        format.html { redirect_to package_group_package_path(@package_group, @package) }
        format.json { render :show, status: :created, location: package_group_package_path(@package_group, @package) }
      else
        @errors = @package.errors.full_messages
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /package_groups/:package_group_id/packages/:package_id
  #
  # PATCH/PUT /package_groups/:package_group_id/packages/:package_id.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        flash[:type] = 'success'
        flash[:message] = 'Package was successfully updated.'
        format.html { redirect_to package_group_package_path(@package_group, @package) }
        format.json { render :show, status: :ok, location: package_group_package_path(@package_group, @package) }
      else
        @errors = @package.errors.full_messages
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # DELETE /package_groups/:package_group_id/packages/:package_id
  #
  # DELETE /package_groups/:package_group_id/packages/:package_id.json
  def destroy
    @package.destroy
    respond_to do |format|
      flash[:success] = 'Package was successfully deleted.'
      format.html { redirect_to package_groups_path }
      format.json { head :no_content }
    end
  end

  private

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_package
    @package = Package.find(params[:id])
  end

  ##
  # Use callbacks to share common setup or constraints between actions.
  def set_package_group
    @package_group = PackageGroup.find(params[:package_group_id])
  end

  ##
  # Never trust parameters from the scary internet, only allow the white list through.
  def package_params
    params.require(:package).permit(:name, :description, :total_cost, :retainer_fee, :duration, :package_group_id)
  end
end
