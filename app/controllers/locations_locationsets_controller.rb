class LocationsLocationsetsController < ApplicationController
  # GET /locations_locationsets
  # GET /locations_locationsets.xml
  def index
    @locations_locationsets = LocationsLocationset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations_locationsets }
    end
  end

  # GET /locations_locationsets/1
  # GET /locations_locationsets/1.xml
  def show
    @locations_locationset = LocationsLocationset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locations_locationset }
    end
  end

  # GET /locations_locationsets/new
  # GET /locations_locationsets/new.xml
  def new
    @locations_locationset = LocationsLocationset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locations_locationset }
    end
  end

  # GET /locations_locationsets/1/edit
  def edit
    @locations_locationset = LocationsLocationset.find(params[:id])
  end

  # POST /locations_locationsets
  # POST /locations_locationsets.xml
  def create
    @locations_locationset = LocationsLocationset.new(params[:locations_locationset])

    respond_to do |format|
      if @locations_locationset.save
        format.html { redirect_to(@locations_locationset, :notice => 'Locations locationset was successfully created.') }
        format.xml  { render :xml => @locations_locationset, :status => :created, :location => @locations_locationset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locations_locationset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations_locationsets/1
  # PUT /locations_locationsets/1.xml
  def update
    @locations_locationset = LocationsLocationset.find(params[:id])

    respond_to do |format|
      if @locations_locationset.update_attributes(params[:locations_locationset])
        format.html { redirect_to(@locations_locationset, :notice => 'Locations locationset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locations_locationset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations_locationsets/1
  # DELETE /locations_locationsets/1.xml
  def destroy
    @locations_locationset = LocationsLocationset.find(params[:id])
    @locations_locationset.destroy

    respond_to do |format|
      format.html { redirect_to(locations_locationsets_url) }
      format.xml  { head :ok }
    end
  end
end
