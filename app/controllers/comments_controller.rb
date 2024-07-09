class CommentsController < ApplicationController
  def index
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id]);
  end

  def create
    @comment = Comment.new(comment_params)


    if @comment.save
      flash[:error_message] = "your comment successfully added! "
      render :index, status: 201
    else
      flash[:error_message] = "Somthing is wrong! your comment is not added"
      render :new, status: :unprocessable_entity
    end
  end
  def show

  end


  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      flash[:error_message] = "Comment Updated succesfully "
      render :index, status:201
    else
      flash[:error_message] = "Something is wrong! Your Comment is not update "
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destroy
      flash[:error_message] = "Comment deleted succesfully "
      redirect_to action: :index
    else
      flash[:error_message] = "Something is wrong! Your Comment is not delete "
      redirect_to action: :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:title, :post_id)
  end
end
