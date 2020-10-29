class SearchController < ApplicationController

  def index
    query = params[:q].presence || false
    redirect_to '/' and return unless query

    @games = Game.search(query, fields: %w[title^10 description developer])
    @paginate = false
    render 'home/index'
  end

  def autocomplete
    query = params[:query].presence || false
    data = Game.search(query, fields: %w[title^10])
    render json: data
  end

end
