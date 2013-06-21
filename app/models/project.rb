class Project < ActiveRecord::Base
  belongs_to :server
  
  attr_accessible :name, :server
  
  validates_presence_of :name, :server
  validates_uniqueness_of :name, :case_sensitive => false, :scope => :server

  def self.create(server, project_name)
    @project = Project.new
    @project.server = server
    @project.name = project_name
    if @project.save
      return true
    else
      return false
    end
  end
end
