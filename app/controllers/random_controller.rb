require 'open-uri'
require "json"

class RandomController < ApplicationController

  def index
    uri = URI("#{ApplicationRecord::API_ADDRESS}/random")
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      puts res.body
      @random_fact = JSON.parse(res.body)
      @random_fact =  @random_fact['value']
    end
    @query = Query.new
  end
  
end