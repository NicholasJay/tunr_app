class UsersController < ApplicationController

  def index
  end

  def new
    render :new
  end

  def create
    @user = User.create({
        email: params[:email], 
        first_name: params[:first_name],
        last_name: params[:last_name],
        dob: params[:dob],
        gender: params[:gender],
        facebook_link: params[:facebook_link],
        password: params[:password]
      })

    if @user.valid?
      redirect_to("/users/#{@user.id}")
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render(:show)
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
      if params[:password].empty? 
        params[:password] = @user.password
      end
    @update = @user.update({
      email: params[:email], 
      first_name: params[:first_name],
      last_name: params[:last_name],
      dob: params[:dob],
      gender: params[:gender],
      facebook_link: params[:facebook_link],
      password: params[:password]
      })
    if @update
      redirect_to("/users/#{@user.id}")
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to("/")
  end


end