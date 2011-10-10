class LocationsetsUsersController < ApplicationController
  # GET /locationsets_users
  # GET /locationsets_users.xml
  def index
    @locationsets_users = LocationsetsUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locationsets_users }
    end
  end

  # GET /locationsets_users/1
  # GET /locationsets_users/1.xml
  def show
    @locationsets_user = LocationsetsUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locationsets_user }
    end
  end

  # GET /locationsets_users/new
  # GET /locationsets_users/new.xml
  def new
    @locationsets_user = LocationsetsUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locationsets_user }
    end
  end

  # GET /locationsets_users/1/edit
  def edit
    @locationsets_user = LocationsetsUser.find(params[:id])
  end

  # POST /locationsets_users
  # POST /locationsets_users.xml
  def create
    @locationsets_user = LocationsetsUser.new(params[:locationsets_user])

    respond_to do |format|
      if @locationsets_user.save
        format.html { redirect_to(@locationsets_user, :notice => 'Locationsets user was successfully created.') }
        format.xml  { render :xml => @locationsets_user, :status => :created, :location => @locationsets_user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locationsets_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locationsets_users/1
  # PUT /locationsets_users/1.xml
  def update
    @locationsets_user = LocationsetsUser.find(params[:id])

    respond_to do |format|
      if @locationsets_user.update_attributes(params[:locationsets_user])
        format.html { redirect_to(@locationsets_user, :notice => 'Locationsets user was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locationsets_user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locationsets_users/1
  # DELETE /locationsets_users/1.xml
  def destroy
    @locationsets_user = LocationsetsUser.find(params[:id])
    @locationsets_user.destroy

    respond_to do |format|
      format.html { redirect_to(locationsets_users_url) }
      format.xml  { head :ok }
    end
  end
end
