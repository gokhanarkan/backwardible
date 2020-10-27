class SearchController < ApplicationController
  def index
    query = params[:q].presence || false
    unless query
      redirect_to '/' and return
    end
    @games = Game.search(query, fields: ['title^10', 'description', 'developer'])
    @paginate = false
    render 'home/index'
  end

  def autocomplete
    query = params[:query].presence || false
    puts query
    data = Game.search(query, fields: ['title^10'])
    puts data
    render json: data
  end
end
