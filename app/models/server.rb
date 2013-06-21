class Server < ActiveRecord::Base
  has_many :projects, :dependent => :restrict
  
  attr_accessible :name, :url, :username, :password

  validates_presence_of :name, :url, :username, :password
  validates_uniqueness_of :name, :case_sensitive => false
  validates_uniqueness_of :url, :case_sensitive => false
end
