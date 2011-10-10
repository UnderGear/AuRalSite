class SynthsController < ApplicationController
  # GET /synths
  # GET /synths.xml
  def index
    @synths = Synth.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @synths }
    end
  end

  # GET /synths/1
  # GET /synths/1.xml
  def show
    @synth = Synth.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @synth }
    end
  end

  # GET /synths/new
  # GET /synths/new.xml
  def new
    @synth = Synth.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @synth }
    end
  end

  # GET /synths/1/edit
  def edit
    @synth = Synth.find(params[:id])
  end

  # POST /synths
  # POST /synths.xml
  def create
    @synth = Synth.new(params[:synth])

    respond_to do |format|
      if @synth.save
        format.html { redirect_to(@synth, :notice => 'Synth was successfully created.') }
        format.xml  { render :xml => @synth, :status => :created, :location => @synth }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @synth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /synths/1
  # PUT /synths/1.xml
  def update
    @synth = Synth.find(params[:id])

    respond_to do |format|
      if @synth.update_attributes(params[:synth])
        format.html { redirect_to(@synth, :notice => 'Synth was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @synth.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /synths/1
  # DELETE /synths/1.xml
  def destroy
    @synth = Synth.find(params[:id])
    @synth.destroy

    respond_to do |format|
      format.html { redirect_to(synths_url) }
      format.xml  { head :ok }
    end
  end
end
