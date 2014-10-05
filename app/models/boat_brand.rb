class BoatBrand < ActiveRecord::Base

  has_many :boat_main_models
  validates_presence_of :name, :description

  mount_uploader :logo, LogoUploader


  def toggle_active!
    if self.active == true 
      self.active = false
    else 
      self.active = true
    end
    self.save
  end  
end