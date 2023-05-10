class HomeController < ApplicationController
  def index
    render json: 'Welcome to Car Rentals API Home'
  end
end
