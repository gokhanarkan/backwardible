class HomeController < ApplicationController
  def index
    page = params[:id]
    @games = Game.page(page).per(12)
    @total_pages = @games.total_pages
    @previous_page = @games.prev_page
    @next_page = @games.next_page
    @first_page = @games.first_page?
    @last_page = @games.last_page?
    @current_page = @games.current_page
    @total_pages = @games.total_pages
  end
end
