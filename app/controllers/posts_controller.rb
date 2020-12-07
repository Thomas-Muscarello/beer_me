class PostsController < ApplicationController
  before_action :find_beer
  before_action :find_post, except: [:new, :create, :index]
  
  def new
    @post = @beer.posts.new
  end
  
  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    @post.beer_id = @beer.id
    #byebug
      if @post.save
        flash[:message] = "The post added successfully for #{@post.beer.name}"
        redirect_to beer_path(@post.beer)
      else
        flash[:message] = @post.errors.full_messages
        render :new
      end
    end
  
    def index
      @posts = @beer.posts
    end
  
    def show
      @post
    end
  
    def edit
      if @post.user = current_user
        render :edit
      else
        redirect_to post_path(@post)
      end
    end

    def update
        if @post.update(post_params)
          flash[:message] = "Your post was updated!!!"
          redirect_to beer_path(@beer)
        else
          render :edit
        end
    end

    def destroy
      if @post.user = current_user
      @post.destroy
      redirect_to user_path(current_user)
      else
      redirect_to beers_path
      end
    end
  

  private
  
    def post_params
      params.require(:post).permit(:text_area, :beer_id, :user_id) 
      
    end
  
    def find_beer
      @beer = Beer.find_by(id: params[:beer_id])
    end

    def find_post
      @post = Post.find_by(id: params[:id])
    end

  
end
