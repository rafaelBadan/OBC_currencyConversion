require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response.status).to eql(200) # status 200 == :success
    end
  end

  describe "POST #convert" do
    before do
      json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))
      @currency, @currency_destination = json['currency_list'].sample(2)
      @amount = rand(1..9999)
    end

    it "returns http success" do
      post :convert, params: {currency: @currency, currency_destination: @currency_destination, amount: @amount}
      expect(response).to have_http_status(:success)
    end

    it "returns a numeric value" do
      post :convert, params: {currency: @currency, currency_destination: @currency_destination, amount: @amount}
      value = JSON.parse(response.body)['value']
      expect(value.is_a? Numeric).to eql(true)
    end
  end

end
