class AudiofilesController < ApplicationController
  # GET /audiofiles
  # GET /audiofiles.xml
  def index
    @audiofiles = Audiofile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audiofiles }
    end
  end

  # GET /audiofiles/1
  # GET /audiofiles/1.xml
  def show
    @audiofile = Audiofile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @audiofile }
    end
  end

  # GET /audiofiles/new
  # GET /audiofiles/new.xml
  def new
    @audiofile = Audiofile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @audiofile }
    end
  end

  # GET /audiofiles/1/edit
  def edit
    @audiofile = Audiofile.find(params[:id])
  end

  # POST /audiofiles
  # POST /audiofiles.xml
  def create
    @audiofile = Audiofile.new(params[:audiofile])

    respond_to do |format|
      if @audiofile.save
        format.html { redirect_to(@audiofile, :notice => 'Audiofile was successfully created.') }
        format.xml  { render :xml => @audiofile, :status => :created, :location => @audiofile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @audiofile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /audiofiles/1
  # PUT /audiofiles/1.xml
  def update
    @audiofile = Audiofile.find(params[:id])

    respond_to do |format|
      if @audiofile.update_attributes(params[:audiofile])
        format.html { redirect_to(@audiofile, :notice => 'Audiofile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @audiofile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /audiofiles/1
  # DELETE /audiofiles/1.xml
  def destroy
    @audiofile = Audiofile.find(params[:id])
    @audiofile.destroy

    respond_to do |format|
      format.html { redirect_to(audiofiles_url) }
      format.xml  { head :ok }
    end
  end
end
