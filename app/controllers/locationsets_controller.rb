class LocationsetsController < ApplicationController
  # GET /locationsets
  # GET /locationsets.xml
  def index
    @locationsets = Locationset.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locationsets }
    end
  end

  # GET /locationsets/1
  # GET /locationsets/1.xml
  def show
    @locationset = Locationset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locationset }
    end
  end

  # GET /locationsets/new
  # GET /locationsets/new.xml
  def new
    @locationset = Locationset.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locationset }
    end
  end

  # GET /locationsets/1/edit
  def edit
    @locationset = Locationset.find(params[:id])
  end

  # POST /locationsets
  # POST /locationsets.xml
  def create
    @locationset = Locationset.new(params[:locationset])

    respond_to do |format|
      if @locationset.save
        format.html { redirect_to(@locationset, :notice => 'Locationset was successfully created.') }
        format.xml  { render :xml => @locationset, :status => :created, :location => @locationset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locationset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locationsets/1
  # PUT /locationsets/1.xml
  def update
    @locationset = Locationset.find(params[:id])

    respond_to do |format|
      if @locationset.update_attributes(params[:locationset])
        format.html { redirect_to(@locationset, :notice => 'Locationset was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locationset.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locationsets/1
  # DELETE /locationsets/1.xml
  def destroy
    @locationset = Locationset.find(params[:id])
    @locationset.destroy

    respond_to do |format|
      format.html { redirect_to(locationsets_url) }
      format.xml  { head :ok }
    end
  end
end
