class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if Current.user.update(profile_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def profile_params
      params.expect(user: [ :email_address, :avatar ])
    end
end
