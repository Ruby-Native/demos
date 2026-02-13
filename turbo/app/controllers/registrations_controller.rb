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
      create_default_links(@user)
      sign_in @user
      redirect_to links_path, notice: native_app? ? nil : "Welcome! Your account has been created."
    else
      @page_title = "Create an account"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def registration_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def create_default_links(user)
    YAML.load_file(Rails.root.join("config/default_links.yml")).each do |attrs|
      link = user.links.create!(title: attrs["title"], url: attrs["url"], description: attrs["description"])
      attrs["tags"].each do |tag_name|
        tag = Tag.find_or_create_by!(name: tag_name)
        LinkTag.find_or_create_by!(link: link, tag: tag)
      end
    end
  end
end
