class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :redirect_if_authenticated, only: :new

  def new
    @page_title = "Sign in"
  end

  def create
    if (user = User.authenticate_by(authentication_params))
      sign_in user
      redirect_to categories_path
    else
      flash.now.alert = "Invalid email or password."
      @page_title = "Sign in"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out current_user
    redirect_to new_session_path
  end

  private

  def authentication_params
    {email: params[:email], password: params[:password]}
  end
end
