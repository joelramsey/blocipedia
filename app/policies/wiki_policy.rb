class WikiPolicy < ApplicationPolicy 

  class Scope  
    def resolve 
      if user.admin? || user.moderator? 
      scope.all

      else
      scope.where(:id => user.id).exists?
       
      end
    end
  end 

  
  def index?
    user.admin? || user.id?
  end
  
  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end

end