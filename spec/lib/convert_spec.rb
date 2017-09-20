require 'spec_helper'
require './lib/convert'

describe Currency do
  it "convert" do
    json = JSON.parse(File.read("./spec/fixtures/currency_list.json"))

    # variable currency is loaded with the first currency sampled from currency_list.json
    # variable currency_destination is loaded with the second sampled currency from currency_list.json
    currency, currency_destination = json['currency_list'].sample(2)

    # randomize the amount of money to be converted
    amount = rand(1..9999)

    value = Currency::convert currency, currency_destination, amount
    expect(value.is_a? Numeric and value != 0).to eql(true)
  end
end
