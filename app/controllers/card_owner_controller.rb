class CardOwnerController < ApplicationController
  def index
    @owner = CardOwner.all
  end
  def show
    @owner = CardOwner.find(params[:id])
  end
end
