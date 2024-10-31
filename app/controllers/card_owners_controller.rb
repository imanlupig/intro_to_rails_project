class CardOwnersController < ApplicationController
  def index
    @owners = CardOwner.includes(:cards)
  end

  def show
    @owner = CardOwner.find(params[:id])
  end
end
