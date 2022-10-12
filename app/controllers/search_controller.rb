require 'open-uri'
require "json"
require 'pagy/extras/array'
class SearchController < ApplicationController
  include Pagy::Backend
  def index
    
  end

  def turbo_frame_form
  end

  def turbo_frame_submit
    uri = URI("#{ApplicationRecord::API_ADDRESS}/search?query=#{params[:any][:search]}")
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      puts res.body
      @query_facts = JSON.parse(res.body)
      @query_facts = @query_facts['result']
      @facts_list_arr = []
      for fact in @query_facts
        @facts_list_arr << fact['value']
      end

      @pagy_a, @facts_list = pagy_array(@facts_list_arr, items: 10)
    end
    @query = Query.new
    extracted_search = params[:any][:search]
    render :turbo_frame_form, status: :ok, locals: {search: extracted_search, comment: 'turbo_frame_submit ok' }
  end
  
end