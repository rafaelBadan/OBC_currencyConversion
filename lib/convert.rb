require 'rest-client'
require 'json'

module Currency
  def self.convert currency, currency_destination, amount
    begin
      res = RestClient.get "http://api.fixer.io/latest?base=#{currency}&symbols=#{currency_destination}"
      rate = JSON.parse(res.body)['rates'][currency_destination]
      return (rate * amount).round(2)
    rescue
      return 'Problem in Conversion'
    end
  end
end
