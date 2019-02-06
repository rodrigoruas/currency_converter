class PagesController < ApplicationController
  include OpenExchange
  def home
    @money = OpenExchange::API.new(Time.now)
    @convert = OpenExchange::MoneyConverter.new("EUR", "BRL", Time.now, 1).convert
  end
end
