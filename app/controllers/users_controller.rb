class UsersController < ApplicationController
   before_action :authenticate_user!
 
   def update
     if current_user.update_attributes(user_params)
       flash[:notice] = "User information updated"
       redirect_to edit_user_registration_path
     else
       flash[:error] = "Invalid user information"
       redirect_to edit_user_registration_path
     end
   end
  
  def show
     @user = User.find(params[:id])
    
  end
  
  def downgrade
   
    current_user.downgrade_to_standard
    current_user.save
    flash[:success] = "Thanks for your contribution, #{current_user.email}! Feel free to return to your premium membership anytime."
    redirect_to wikis_path
  end
 
   private
 
   def user_params
     params.require(:user).permit(:user_name, :avatar)
   end
 end