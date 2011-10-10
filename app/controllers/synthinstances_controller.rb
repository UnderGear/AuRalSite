class SynthinstancesController < ApplicationController
  # GET /synthinstances
  # GET /synthinstances.xml
  def index
    @synthinstances = Synthinstance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @synthinstances }
    end
  end

  # GET /synthinstances/1
  # GET /synthinstances/1.xml
  def show
    @synthinstance = Synthinstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @synthinstance }
    end
  end

  # GET /synthinstances/new
  # GET /synthinstances/new.xml
  def new
    @synthinstance = Synthinstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @synthinstance }
    end
  end

  # GET /synthinstances/1/edit
  def edit
    @synthinstance = Synthinstance.find(params[:id])
  end

  # POST /synthinstances
  # POST /synthinstances.xml
  def create
    @synthinstance = Synthinstance.new(params[:synthinstance])

    respond_to do |format|
      if @synthinstance.save
        format.html { redirect_to(@synthinstance, :notice => 'Synthinstance was successfully created.') }
        format.xml  { render :xml => @synthinstance, :status => :created, :location => @synthinstance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @synthinstance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /synthinstances/1
  # PUT /synthinstances/1.xml
  def update
    @synthinstance = Synthinstance.find(params[:id])

    respond_to do |format|
      if @synthinstance.update_attributes(params[:synthinstance])
        format.html { redirect_to(@synthinstance, :notice => 'Synthinstance was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @synthinstance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /synthinstances/1
  # DELETE /synthinstances/1.xml
  def destroy
    @synthinstance = Synthinstance.find(params[:id])
    @synthinstance.destroy

    respond_to do |format|
      format.html { redirect_to(synthinstances_url) }
      format.xml  { head :ok }
    end
  end
end
