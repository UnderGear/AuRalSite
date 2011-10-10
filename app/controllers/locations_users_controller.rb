class LocationsUsersController < ApplicationController
  # GET /locations_users
  # GET /locations_users.xml
  def index
    @locations_users = LocationsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations_users }
    end
  end

  # GET /locations_users/1
  # GET /locations_users/1.xml
  def show
    @locations_user = LocationsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locations_user }
    end
  end

  # GET /locations_users/new
  # GET /locations_users/new.xml
  def new
    @locations_user = LocationsUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locations_user }
    end
  end

  # GET /locations_users/1/edit
  def edit
    @locations_user = LocationsUser.find(params[:id])
  end

  # POST /locations_users
  # POST /locations_users.xml
  def create
    @locations_user = LocationsUser.new(params[:locations_user])

    respond_to do |format|
      if @locations_user.save
        format.html { redirect_to(@locations_user, :notice => 'Locations user was successfully created.') }
        format.xml  { render :xml => @locations_user, :status => :created, :location => @locations_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locations_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations_users/1
  # PUT /locations_users/1.xml
  def update
    @locations_user = LocationsUser.find(params[:id])

    respond_to do |format|
      if @locations_user.update_attributes(params[:locations_user])
        format.html { redirect_to(@locations_user, :notice => 'Locations user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locations_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations_users/1
  # DELETE /locations_users/1.xml
  def destroy
    @locations_user = LocationsUser.find(params[:id])
    @locations_user.destroy

    respond_to do |format|
      format.html { redirect_to(locations_users_url) }
      format.xml  { head :ok }
    end
  end
end
