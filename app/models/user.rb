class User < ActiveRecord::Base
  
  has_many :wikis
  has_many :collaborations
  has_many :collaborated_wikis, through: :collaborations, source: :wiki
  
  mount_uploader :avatar, AvatarUploader
  
  after_create :initialize_user
  
  def admin?
   role == 'admin'
  end
 
  def premium?
    role == 'premium'
  end
  
  def standard?
    role == 'standard'
  end
  
  def initialize_user
    self.update_attributes(role: 'standard')
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
