class ServersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index
    @servers = Server.all
  end
  
  def new
    @server = Server.new
  end

  def create
    @server = Server.new params[:server]
    if @server.save
      redirect_to servers_path
    else
      render :action => 'new'
    end
  end

  def edit
    @server = Server.find params[:id]
  end

  def update
    @server = Server.find params[:id]
    if @server.update_attributes params[:role]
      redirect_to servers_path
    else
      render :action => :edit
    end
  end

  def destroy
    @server = Server.find params[:id]
    if @server.projects.empty?
      @server.destroy
      redirect_to servers_path
    else
      redirect_to servers_path, :flash => { :error => "Cannot delete a server which is referenced by a project." }      
    end
  end
end
