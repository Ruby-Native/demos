class TagsController < ApplicationController
  def index
    @tags = Tag.joins(:links)
      .where(links: {user_id: current_user.id})
      .select("tags.*, COUNT(link_tags.id) AS links_count")
      .group("tags.id")
      .order("links_count DESC")
    @page_title = "Tags"
  end

  def show
    @tag = Tag.find(params.expect(:id))
    @links = current_user.links.joins(:tags).where(tags: {id: @tag.id}).includes(:tags)
    @page_title = @tag.name
  end
end
