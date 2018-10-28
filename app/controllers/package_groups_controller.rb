##
# = PackageGroupsController
# Author::    Richard Davis
# Copyright:: Copyright 2018-2019 Mushaka Solutions Inc.
# License::   GNU Public License 3
#
# This controller provides methods for accessing package group resources.
#
# Package groups have many packages.
class PackageGroupsController < ApplicationController
  before_action :require_login
  before_action :set_package_group, only: %i[edit update destroy]

  ##
  # GET /package_groups/new
  def index
    @package_groups = PackageGroup.all
  end

  ##
  # GET /package_groups/new
  def new
    @package_group = PackageGroup.new
  end

  ##
  # GET /package_groups/:package_group/edit
  def edit; end

  ##
  # POST /package_groups
  #
  # POST /package_groups.json
  def create
    @package_group = PackageGroup.create(package_group_params)

    respond_to do |format|
      if @package_group.save
        flash[:type] = 'success'
        flash[:message] = 'Package group was successfully created.'
        format.html { redirect_to package_groups_path }
        format.json { render :show, status: :created, location: package_groups_path }
      else
        @errors = @package_group.errors.full_messages
        format.html { render :new }
        format.json { render json: @package_group.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /package_groups/:package_group_id
  #
  # PATCH/PUT /package_groups/:package_group_id.json
  def update
    respond_to do |format|
      if @package_group.update(package_group_params)
        flash[:type] = 'success'
        flash[:message] = 'Package group was successfully updated.'
        format.html { redirect_to package_groups_path }
        format.json { render :show, status: :ok, location: package_groups_path }
      else
        @errors = @package_group.errors.full_messages
        format.html { render :edit }
        format.json { render json: @package_group.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # DELETE /package_groups/:package_group_id
  #
  # DELETE /package_groups/:package_group_id.json
  def destroy
    @package_group.destroy
    respond_to do |format|
      flash[:type] = 'success'
      flash[:message] = 'Package group was successfully deleted.'
      format.html { redirect_to package_groups_path }
      format.json { head :no_content }
    end
  end

  private

  ##
  # Sets package group for individual resource actions
  def set_package_group
    @package_group = PackageGroup.find(params[:id])
  end

  ##
  # Whitelists parameters
  def package_group_params
    params.require(:package_group).permit(:name, :description)
  end
end
