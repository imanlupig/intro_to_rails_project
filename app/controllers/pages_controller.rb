class PagesController < ApplicationController
  def index
    @cards = Card.all
  end

  def about
  end


end
