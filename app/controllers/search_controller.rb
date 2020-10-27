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
end
