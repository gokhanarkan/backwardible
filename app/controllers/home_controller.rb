class HomeController < ApplicationController
  def index
    # Get the page param
    page = params[:page]

    # Grab data from db
    @games = Game.page(page).per(12)

    # Create attributes of the data
    @current_page = @games.current_page
    @total_pages = @games.total_pages

    # Check if the page is relevant
    if @current_page > @total_pages
      render_404
    end

    # More data
    @previous_page = @games.prev_page
    @next_page = @games.next_page
    @first_page = @games.first_page?
    @last_page = @games.last_page?

    # Create pages
    @page_range = if @first_page || @current_page < 4
                    1..6
                  elsif @current_page + 2 > @total_pages
                    @total_pages - 3..@total_pages
                  elsif @last_page
                    @current_page - 3..@current_page
                  else
                    @current_page - 3..@current_page + 3
                  end
  end
  def render_404
  respond_to do |format|
    format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
    format.xml  { head :not_found }
    format.any  { head :not_found }
  end
end
end
