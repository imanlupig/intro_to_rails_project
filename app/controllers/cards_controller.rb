class CardsController < ApplicationController
  def index
    if params[:query].present?
      @results = Card.where("name LIKE ?", "%#{params[:query]}%")
      @cards = []
    else
      @cards = Card.limit(200)
      @results = []
    end
  end

  def search
    redirect_to cards_path(query: params[:query])
  end
end
