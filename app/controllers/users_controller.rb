class UsersController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id

      render :index, status: 201
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update

  end



  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(email: login_params[:email])
    if @user == nil
      flash.now[:error_message] = "User not found with this email please sign up"
      render :login_form, status: :unprocessable_entity
    elsif @user.password == login_params[:password]
      session[:user_id] = @user.id
      redirect_to :action=> "index"
    else
      flash.now[:error_message] = "Password is incorrect"
      render :login_form, status: :unprocessable_entity
    end
  end

  def logout
    session.delete(:user_id)
    redirect_to action: :login_form
  end



  def destroy
    @user = User.find(session[:user_id])

    if @user.destroy
      flash[:error_message] = "your account successfully deleted"
      redirect_to action: :login_form
    else
      flash[:error_message] = "your account successfully deleted"
      render :index, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  def login_params
    params.require(:user).permit(:email, :password)
  end

end
