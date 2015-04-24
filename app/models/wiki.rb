class Wiki < ActiveRecord::Base
  
  belongs_to :user, dependent: :destroy
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user

  scope :private_wikis, -> (user) { where(private: true) }
  scope :public_wikis, -> (user) { where(private: false) }

  def public?
    self.private == false
  end

  def private?
    self.private == true
  end
  
  validates :title, length: {minimum: 6}, presence: true
  validates :body, length: {minimum: 10}, presence: true
  
  default_scope { order('title ASC') }
  
  
end
