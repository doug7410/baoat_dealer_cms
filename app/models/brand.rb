class Brand < ActiveRecord::Base

  has_many :boat_main_models
  has_many :boats
  has_many :motors
  validates_presence_of :name, :description, :logo



  def toggle_active!
    if self.active == true 
      self.active = false
    else 
      self.active = true
    end
    self.save
  end  
end