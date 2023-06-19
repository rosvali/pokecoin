class PagesController < ApplicationController
  def home
    render json: { message: "Bienvenue sur pokecoin"}, status: 200
  end
end
