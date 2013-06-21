class Project < ActiveRecord::Base
  belongs_to :server
  
  attr_accessible :name, :server
  
  validates_presence_of :name, :server
  validates_uniqueness_of :name, :case_sensitive => false, :scope => :server_id
end
