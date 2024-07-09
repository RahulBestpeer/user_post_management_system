class PostsController < ApplicationController
  def index

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render "index", status: 201
    else
      render "new", status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:message] = "post Updated succesfully"
      render "index", status: 2001
    else
      flash[:message] = "Something is wrong! post is not Update "
      render "index", status: :unprocessable_entity
    end

  end

  def destroy


    post = Post.find(params[:id])

    if post.destroy
      flash[:message] = "post deleted succesfully"
      redirect_to action: :index
    else
      flash[:message] = "Something is wrong! post is not deleted"
      redirect_to action: :index

    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description,:user_id)
  end
end
