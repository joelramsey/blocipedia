class WikisController < ApplicationController
  def index   
    @wikis = Wiki.all
  end

  def show
    @user = current_user
    @wiki = Wiki.find(params[:id])
  end

  def new
    @user = current_user
    @wiki = Wiki.new
  end
  
  def create
    @user = current_user
    @wiki = current_user.wikis.build(wiki_params)
   
     if @wiki.save
       flash[:notice] = "Wiki was saved."
       redirect_to @wiki
     else
       flash[:error] = "There was an error saving your wiki. Please try again."
       render :new
     end
   end

  def edit
    @user = current_user
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @user = current_user
    @wiki = Wiki.find(params[:id])
       
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was successfully updated."
      redirect_to action: 'index'
      
    else
      flash[:alert] = "Error updating wiki."
      redirect_to action: 'index'
    end
  end
  
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
   end
end
