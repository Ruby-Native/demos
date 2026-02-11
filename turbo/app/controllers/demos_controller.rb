class DemosController < ApplicationController
  def show
    sleep 3 if params[:slow]
    raise "Demo error" if params[:error]
    @page_title = params[:slow] ? "Slow page" : "Demo"
  end
end
