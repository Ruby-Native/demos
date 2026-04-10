class ProfilesController < ApplicationController
  def show
    @stamp_count = current_user.stamps.count
    @bookmark_count = current_user.bookmarks.count
  end

  def edit
  end

  def update
    if current_user.update(profile_params)
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    current_user.destroy
    sign_out current_user
    redirect_to root_path
  end

  private

  def profile_params
    params.expect(user: [ :name ])
  end
end
