class UsersController < ApplicationController
    before_action :load_user, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new     
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to("/users/#{@user.id}")
    else
      render :new
    end
  end

  def show
    render(:show)
  end

  def edit
    render :edit
  end

  def update
    @update = @user.update(user_params)

    if @update
      redirect_to("/users/#{@user.id}")
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to("/")
  end

  private
    def load_user
      return @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:id, :email, :first_name, :last_name, :dob, :gender, :password, :facebook_link)
    end


end