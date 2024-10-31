class CardsController < ApplicationController
  def index
    if params[:query].present? || params[:card_type_id].present?
      # show all cards
      @results = Card.all

      # apply name search
      if params[:query].present?
        @results = @results.where("name LIKE ?", "%#{params[:query]}%")
      end

      # apply type filter
      if params[:card_type_id].present?
        @results = @results.where(card_type_id: params[:card_type_id])
      end

      @results = @results.page(params[:page]).per(25)
      @cards = []
    else

      @cards = Card.limit(200).page(params[:page]).per(25)
      @results = []
    end
  end

  def search
    redirect_to cards_path(query: params[:query], card_type_id: params[:card_type_id])
  end

  def show
    @card = Card.find(params[:id])
  end
end
