require 'rails_helper'
describe "#checkAPI" do
  it "check if the API is working" do
    response = OpenExchange::API.new(Time.now)
    expect(response.to_json).to have_key("rates")
  end
end

describe "#checkUSD" do
  it "check the base currency is correct" do
    response = OpenExchange::API.new(Time.now)
    expect(response.to_json["rates"]["USD"]).to eq (1)
  end
end

describe "#checkConversion" do
  it "check if currency is being converted" do
    response = OpenExchange::MoneyConverter.new("EUR", "EUR", Time.now, 1)
    expect(response.convert).to eq (1)
  end
end
