class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :landing
  before_action :redirect_to_links, only: :landing

  def landing
  end

  private

  def redirect_to_links
    redirect_to links_path if user_signed_in?
  end
end
