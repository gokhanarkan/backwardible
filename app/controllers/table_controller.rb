class TableController < ApplicationController
  def index
    page = params[:page].presence || '1'
    @games = Game.page(page).per(25)
    return no_games if @games.current_page > @games.total_pages

    @nav = 'table'
    @tab = false
    @page_range = helpers.get_page_range(@games)
    render action: 'index', layout: 'home'
  end

  def top
    page = params[:page].presence || '1'
    @games = Game.order(score: :desc).page(page).per(25)
    return no_games if @games.current_page > @games.total_pages

    @nav = 'table'
    @tab = true
    @page_range = helpers.get_page_range(@games)
    render action: 'index', layout: 'home'
  end

  def no_games
    render json: { error: 'Index out of range.' }
  end

end
