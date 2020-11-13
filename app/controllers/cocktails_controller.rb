class CocktailsController < ApplicationController
    def index #read all
        @cocktails = Cocktail.all
        end
    
    def show
        @cocktail = Cocktail.find(params[:id])
    end

    def new
        @cocktail = Cocktail.new
      end

    def create
        @cocktail = Cocktail.new(cocktail_params)
        if @cocktail.save
        redirect_to @cocktail
        else
        render :new
      end
      end

      def destroy
        @cocktail = Cocktail.find(params[:id])
        @cocktail.destroy
    
        redirect_to cocktails_path(@cocktail)
      end
      
      private
    
      def cocktail_params
        params.require(:cocktail).permit(:name, :photo)
      end
end
