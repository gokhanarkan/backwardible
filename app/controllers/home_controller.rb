class HomeController < ApplicationController
  def index
    page = params[:page]
    @games = Game.page(page).per(12)
    @total_pages = @games.total_pages
    @previous_page = @games.prev_page
    @next_page = @games.next_page
    @first_page = @games.first_page?
    @last_page = @games.last_page?
    @current_page = @games.current_page
    @total_pages = @games.total_pages
    @page_range = 1..3
    if @first_page
      @page_range = 1..3
    elsif @last_page
      @page_range = @current_page-1..@current_page
    else
      @page_range = @current_page-1..@current_page+1
    end
  end
end
