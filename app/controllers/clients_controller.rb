class ClientsController < ApplicationController
  before_filter :load_user

  def load_user
    @user = User.find(params[:user_id])
  end

  
  # GET /clients
  # GET /clients.xml
  def index
    @clients = @user.clients.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.xml
  def show
    @client = @user.clients.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client }
    end
  end


  # GET /clients/new
  # GET /clients/new.xml
  
  def new
#    @user = User.find(params[:user_id])
    @client = @user.clients.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = @user.clients.find(params[:id])
  end

  # POST /clients
  # POST /clients.xml
  def create
    @client = @user.clients.build(params[:client])
#@client = @user.clients.build(params[:id])
#@client = @user.clients.build
    respond_to do |format|
      if @client.save
        flash[:notice] = 'Client was successfully created.'
        format.html { redirect_to user_clients_path }
        format.xml  { render :xml => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.xml
  def update
    @client = @user.clients.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        flash[:notice] = 'Client was successfully updated.'
        format.html { redirect_to(@user,@client) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.xml
  def destroy
    @client = @user.clients.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to(user_clients_url(@user)) }
      format.xml  { head :ok }
    end
  end
end
