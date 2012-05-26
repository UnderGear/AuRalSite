class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def device_create
    @user = User.new(params[:user])
    data = {"active" => true, "name" => params[:name], "password" => params[:password], "latitude" => params[:latitude], "longitude" => params[:longitude], "synth_id" => 1, "audio_id" => 1, "ip" => request.remote_ip, "synth_id" => 1, "audio_id" => 1}
    @user.update_attributes(data)
    respond_to do |format|
      if @user.save
        #create a userparam for this
        #@userparam = Userparam.new_by_user_id(@user.id)
        @userparam = Userparam.new
        @userparam.user_id = @user.id
        @userparam.save
        format.html { render :text => @user.id }
        format.xml { render :text => @user.id }
      else
        format.html { render :text => 0 }
        format.xml  { render :text => 0 }
      end
    end
  end

  def device_login
    #check if the username and password match. return the id if yes. 0 if no.
    #set that @user as active
    @user = User.find_by_name(params[:name])
    response = ""
    unless @user.nil?
      if @user.password == params[:password]
        data = {"active" => true, "ip" => request.remote_ip}
        @user.update_attributes(data)
        response = @user.id
      else
        response = 0
      end
    Location.aggregate_params(@user)
    end
    respond_to do |format|
      format.html { render :text => response }
      format.xml { render :text => response }
    end
  end

  def device_logout
    @user = User.find(params[:id])
    data = {"active" => false, "ip" => request.remote_ip}
    @user.update_attributes(data)
    @user.locations = []
    @user.save
    respond_to do |format|
      format.html { render :text => 0 }
      format.xml  { render :text => 0 }
    end
  end

  def device_edit
    @user = User.find(params[:id])
    data = {"name" => params[:name], "password" => params[:password], "ip" => request.remote_ip}

    respond_to do |format|
      if @user.update_attributes(data)
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def device_update_params
    @param = Userparam.find_by_user_id(params[:id])
    if (params[:param_1] != nil)
      @param.value_1 = params[:param_1]
    end
    if (params[:param_2] != nil)
      @param.value_2 = params[:param_2]
    end
    if (params[:param_3] != nil)
      @param.value_3 = params[:param_3]
    end
    @param.save
    Location.aggregate_params(User.find(params[:id]))
    respond_to do |format|
      format.html { render :text => "cool story" }
      format.xml { render :text => "cool story" }
    end
  end

  def device_enter_location
    @location = Location.find_by_name(params[:location_name])
    
    @location.user_ids = @location.user_ids + [params[:id]]
    logger.debug("ids = #{@location.user_ids.inspect}")
    @location.save
    Location.aggregate_params_location(@location)
    respond_to do |format|
      format.html { render :text => "cool story" }
      format.xml { render :text => "cool story" }
    end
  end

  def device_exit_location
    @location = Location.find_by_name(params[:location_name])
    @location.users.delete(User.find(params[:id]))
    Location.aggregate_params_location(@location)
    respond_to do |format|
      format.html { render :text => "cool story" }
      format.xml { render :text => "cool story" }
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/device_update/1
  # PUT /users/device_update/1.xml
  def update_2
    @user = User.find(params[:id])
    data = {"latitude" => params[:latitude], "longitude" => params[:longitude], "ip" => request.remote_ip}
    
    respond_to do |format|
      if @user.update_attributes(data)
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
