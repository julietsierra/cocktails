class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    respond_to do |format|
      if @cocktail.save
        format.html { redirect_to cocktails_path }
        flash[:success] = "Le cocktail a bien été enregistré"
      else
        format.html { render "new" }
        flash[:error] = "Erreur"
      end
    end
  end

  def update
     @cocktail = Cocktail.find(params[:id])
    respond_to do |format|
      if @cocktail.update_attributes(cocktail_params)
        format.html { redirect_to cocktails_path }
        flash[:success] = "Le cocktail a bien été modifié"
      else
        format.html { render "edit" }
        flash[:error] = "Erreur"
      end
    end
  end

  def display_ingredients
    @cocktail = Cocktail.find(params[:id])
  end


   def search
    if params[:search]
      @cocktail = Cocktail.search(params[:search]).order("created_at DESC")
    else
      @cocktail = Cocktail.order("created_at DESC")
    end
  end

  private

    def cocktail_params
      params.require(:cocktail).permit(:name, :description)
    end

end



