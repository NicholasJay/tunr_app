class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    # authenticate: check whether this info matches what's in the database
    # and if so go to the user page, if not ... Self destruct!

    #find if any user has that email
    user = User.find_by(email: params[:email])

    #if that user exists and has a password that was sent
    if user && (user.password == params[:password])

    #save the user_id in the session hash and redirect to the user's homepage
      session[:user_id] = user.id
      redirect_to (user_path(user) )

    else
      @message = "User Not Found or Wrong Password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
