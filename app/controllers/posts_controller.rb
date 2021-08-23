class PostsController < ApplicationController
  before_action :check_current_user

  def index
    @posts = Post.all 
    @post = Post.new
    respond_to do |format|
      format.html{
        render :index
      }
      format.json{
        render json: @posts
      }
    end
  end

  def create   
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      respond_to do |format|
        format.html {
        redirect_to root_path
        }
        format.json {
        render json: @post
        }
      end
    else
      @posts = Post.all
      render :index
    end    
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      respond_to do |format|
          format.html {
          redirect_to root_path
          }
          format.json {
          render json: @post
          }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html {
      redirect_to root_path
      }
      format.json {}
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
