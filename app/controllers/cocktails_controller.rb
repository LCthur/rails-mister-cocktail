class CocktailsController < ApplicationController

  def home
    @cocktails = Cocktail.all
    @disable_nav = true
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @disable_nav = false
  end

  def index
    @cocktails = Cocktail.all
    @disable_nav = true
  end

  def new
    @cocktail = Cocktail.new
    @disable_nav = true
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
