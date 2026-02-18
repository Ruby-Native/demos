class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :redirect_if_authenticated, only: :new

  def new
    @user = User.new
    @page_title = "Create an account"
  end

  def create
    @user = User.new(registration_params)

    if @user.save
      sign_in @user
      redirect_to categories_path
    else
      @page_title = "Create an account"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
