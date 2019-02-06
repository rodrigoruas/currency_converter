require "open_exchange/api"

module OpenExchange
  class MoneyConverter
    def initialize(base, currency, date, base_value)
      @base = base
      @currency = currency
      @date = date
      @value = base_value
    end

    def convert
      @money = OpenExchange::API.new(@date)
      base_in_usd = @money.to_json["rates"][@base]
      currency_in_usd = @money.to_json["rates"][@currency]
      ((currency_in_usd / base_in_usd) * @value).round(2)
    end
  end
end
