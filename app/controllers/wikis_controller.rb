class WikisController < ApplicationController
  def index   
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @user = current_user
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @user = current_user
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    @user = current_user
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
   
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
    authorize @wiki
  end
  
  def update
    @user = current_user
    @wiki = Wiki.find(params[:id])
    authorize @wiki
       
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was successfully updated."
      redirect_to action: 'index'
      
    else
      flash[:alert] = "Error updating wiki."
      redirect_to action: 'index'
    end
  end
  
  def destroy
     @wiki = Wiki.find(params[:id])
     authorize @wiki
    
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       
     else
       flash[:error] = "There was an error deleting the wiki."
       
     end
    respond_to do |format|
       format.html
       format.js
     end
   end
  
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
   end
end
