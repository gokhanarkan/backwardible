class TableController < ApplicationController
  def index
    @games = Game.all
    @nav = 'table'
    render layout: 'home'
  end
end
