class Project < ActiveRecord::Base
  belongs_to :server
  
  attr_accessible :name, :server
  
  validates_presence_of :name, :server
  validates_uniqueness_of :name, :case_sensitive => false, :scope => :server

  def self.create(server, projectname)
    @project = Project.new
    @project.server = server
    @project.name = projectname
    if @project.save
      return true
    else
      return false
    end
  end
end
