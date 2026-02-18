class AccountsController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if current_user.update(account_params)
      redirect_to account_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:user).permit(:name, :email, :favorite_store)
  end
end
