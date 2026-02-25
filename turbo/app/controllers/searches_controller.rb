class SearchesController < ApplicationController
  def show
    @query = params[:query]
    if @query.present?
      @links = current_user.links.includes(:tags)
        .left_joins(:tags)
        .where("links.title LIKE :q OR links.url LIKE :q OR links.description LIKE :q OR tags.name LIKE :q", q: "%#{@query}%")
        .distinct
        .order(created_at: :desc)
    else
      @links = Link.none
    end
  end
end
