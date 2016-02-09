class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update(user_params)
        redirect_to @user
      else
        render :edit
      end
    else
      render :edit
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to index
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
