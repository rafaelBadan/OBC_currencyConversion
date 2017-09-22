class HomeController < ApplicationController
  def index
  end

  def convert
    value = Currency::convert params[:currency], params[:currency_destination], params[:amount].to_f
    render json: {"value": value}
  end
end
