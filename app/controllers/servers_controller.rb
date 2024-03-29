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
    if @server.update_attributes params[:server]
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

  def import
    # TODO: Flash message "Import running ..."
    @server = Server.find params[:id]
    gerrit = Gerry.new(@server.url, @server.username, @server.password)
    projects_list = gerrit.projects

    projects_list.values.each { |p|
      project_name = p["id"]
      if !Project.find_by_server_id_and_name(@server, project_name)
        if !Project.create(@server, project_name)
          # TODO: Handle failing save
        end
      end
#      query_string = "q=status:merged+project:#{project_name}+-age:1week&o=ALL_REVISIONS&o=ALL_COMMITS&o=DETAILED_LABELS&o=DETAILED_ACCOUNTS&o=CURRENT_FILES"
      query_string = "q=status:merged+project:#{project_name}+-age:1month&o=ALL_REVISIONS&o=ALL_COMMITS&o=DETAILED_LABELS&o=DETAILED_ACCOUNTS&o=CURRENT_FILES"
      project_changes = gerrit.changes([query_string])
    }

    redirect_to servers_path, :flash => { :notice => "Import successful." }
  end
end
