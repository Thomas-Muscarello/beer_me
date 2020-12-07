class BeersController < ApplicationController
  before_action :find_beer, only: [:show, :edit, :update, :destroy]
  before_action :redirect_if_not_logged_in

    def index
      @beers = helpers.all_beers
    end

    def show
      @post = @beer.posts.new
    end
  
    def new
      @beer = Beer.new
      @post = @beer.posts.build
    end
  
    def create
      @beer = Beer.new(beer_params) 
      if @beer.save
        @post = @beer.posts.create(post_params)
          @post.user = current_user
          @post.save
            flash[:message] = "#{@beer.name} has been made"
          redirect_to beer_path(@beer)
      else
        flash[:message] = @beer.errors.full_messages
        render :new
      end
    end
  
    def update
      if @beer.update(beer_params)
        flash[:message] = "#{@beer.name} updated"
          redirect_to beer_path(@beer)
        else
          render :edit
      end
    end

    def high_abv
      @beers = Beer.abv_higher_than_5
      render :index
    end
  
    def destroy
      @beer.destroy
      redirect_to beers_path
    end
  
    private
  
    def find_beer
      @beer = Beer.find_by(id: params[:id])
      redirect_to beers_path unless @beer
    end

    def beer_params
      params.require(:beer).permit(:name, :malt, :malt_amount, :hop, :hop_amount, :yeast, :yeast_amount, :abv)
      end

    def post_params
      params.require(:post).permit(:text_area)
    end
end
