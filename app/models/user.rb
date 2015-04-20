class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  after_initialize :init

    def init
      self.role  ||= 'standard'  #will set the default value only if it's nil
    end
  
  has_many :wikis
  
  mount_uploader :avatar, AvatarUploader
  
  def admin?
   role == 'admin'
  end
 
  def premium?
    role == 'premium'
  end
  
  def standard?
    role == 'standard'
  end
  
  def upgrade_to_premium
    update_attributes(role: "premium")
  end

  def downgrade_to_standard
    update_attributes(role: "standard")
  end
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
