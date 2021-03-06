require "uri"
require "net/http"

class TableController < ApplicationController
  def index
  end

  def create
    render json: params
  end

  def request_markets()

    markets=[]

    # Fetching  buda markets to retrive ids, code auto generated by postman
    url = URI("https://www.buda.com/api/v2/markets")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"
    response = https.request(request)

    # Iterating over response to work data
    data=JSON.parse(response.body)
    data['markets'].each do |child|
      markets.push(child['id'])
    end

    puts markets
    @markets=markets

  end

  def generate
    actual_time= (Time.now.to_f * 1000).floor
    sec = (actual_time / 1000)
    @request_time=Time.at(sec)
    @max_transaction_data=[]

    request_markets()
    
    @markets.each do |child|
      @max_transaction_data.push(
        max_price(child,actual_time,actual_time-86400000,{"max_transaction_value"=> 0 ,"max_transaction" =>[]})
      )

    end
    puts @max_transaction_data
  end

  def max_price(market,timestamp_milis,end_time,transaction_hash)
    max_transaction_value=transaction_hash["max_transaction_value"]
    url = URI("https://www.buda.com/api/v2/markets/#{market}/trades?timestamp=#{timestamp_milis}&limit=100")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["Content-Type"] = "application/json"
  
    response = https.request(request)
    data=JSON.parse(response.body)
    data['trades']['entries'].each do |child|
      if transaction_hash["max_transaction_value"] < child[1].to_f
        transaction_hash["max_transaction_value"]=child[1].to_f
        transaction_hash["max_transaction"]=child
      end
    

    end
    if data['trades']['last_timestamp'].to_i >= end_time
      max_price(market,data['trades']['last_timestamp'].to_i,end_time,transaction_hash)
    else
      puts 'Lo encontramos'
      return transaction_hash
    end
    

  end


end
