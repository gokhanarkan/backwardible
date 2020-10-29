class HomeController < ApplicationController

  def index
    page = params[:page].presence || '1'
    @games = Game.page(page).per(14)
    render_404 if @games.current_page > @games.total_pages
    @nav = 'home'
    @page_range = helpers.get_page_range(@games)

  end

  def top
    page = params[:page].presence || '1'
    @games = Game.order(score: :desc).page(page).per(14)
    render_404 if @games.current_page > @games.total_pages
    @page_range = helpers.get_page_range(@games)
    @nav = 'top'
    render 'home/index'
  end

  def render_404
    respond_to do |format|
      format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end
end
