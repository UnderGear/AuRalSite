class GroupsLocationsController < ApplicationController
  # GET /groups_locations
  # GET /groups_locations.xml
  def index
    @groups_locations = GroupsLocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups_locations }
    end
  end

  # GET /groups_locations/1
  # GET /groups_locations/1.xml
  def show
    @groups_location = GroupsLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @groups_location }
    end
  end

  # GET /groups_locations/new
  # GET /groups_locations/new.xml
  def new
    @groups_location = GroupsLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @groups_location }
    end
  end

  # GET /groups_locations/1/edit
  def edit
    @groups_location = GroupsLocation.find(params[:id])
  end

  # POST /groups_locations
  # POST /groups_locations.xml
  def create
    @groups_location = GroupsLocation.new(params[:groups_location])

    respond_to do |format|
      if @groups_location.save
        format.html { redirect_to(@groups_location, :notice => 'Groups location was successfully created.') }
        format.xml  { render :xml => @groups_location, :status => :created, :location => @groups_location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @groups_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups_locations/1
  # PUT /groups_locations/1.xml
  def update
    @groups_location = GroupsLocation.find(params[:id])

    respond_to do |format|
      if @groups_location.update_attributes(params[:groups_location])
        format.html { redirect_to(@groups_location, :notice => 'Groups location was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @groups_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups_locations/1
  # DELETE /groups_locations/1.xml
  def destroy
    @groups_location = GroupsLocation.find(params[:id])
    @groups_location.destroy

    respond_to do |format|
      format.html { redirect_to(groups_locations_url) }
      format.xml  { head :ok }
    end
  end
end
