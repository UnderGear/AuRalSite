class UserparamsController < ApplicationController
  # GET /userparams
  # GET /userparams.xml
  def index
    @userparams = Userparam.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @userparams }
    end
  end

  # GET /userparams/1
  # GET /userparams/1.xml
  def show
    @userparam = Userparam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @userparam }
    end
  end

  # GET /userparams/new
  # GET /userparams/new.xml
  def new
    @userparam = Userparam.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @userparam }
    end
  end

  # GET /userparams/1/edit
  def edit
    @userparam = Userparam.find(params[:id])
  end

  # POST /userparams
  # POST /userparams.xml
  def create
    @userparam = Userparam.new(params[:userparam])

    respond_to do |format|
      if @userparam.save
        format.html { redirect_to(@userparam, :notice => 'Userparam was successfully created.') }
        format.xml  { render :xml => @userparam, :status => :created, :location => @userparam }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @userparam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /userparams/1
  # PUT /userparams/1.xml
  def update
    @userparam = Userparam.find(params[:id])

    respond_to do |format|
      if @userparam.update_attributes(params[:userparam])
        format.html { redirect_to(@userparam, :notice => 'Userparam was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @userparam.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /userparams/1
  # DELETE /userparams/1.xml
  def destroy
    @userparam = Userparam.find(params[:id])
    @userparam.destroy

    respond_to do |format|
      format.html { redirect_to(userparams_url) }
      format.xml  { head :ok }
    end
  end
end
