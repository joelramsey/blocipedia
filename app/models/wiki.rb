class Wiki < ActiveRecord::Base
  belongs_to :user
  
  validates :title, length: {minimum: 6}, presence: true
  validates :body, length: {minimum: 10}, presence: true
  
  
  default_scope { order('title ASC') }
  
  
end
