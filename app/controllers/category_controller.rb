require 'open-uri'
require "json"

class CategoryController < ApplicationController

  def index
    uri = URI("#{ApplicationRecord::API_ADDRESS}/categories")
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      puts res.body
      @categories = JSON.parse(res.body)
    end

  end
  
  def turbo_frame_form
  end

  def turbo_frame_submit
    uri = URI("#{ApplicationRecord::API_ADDRESS}/categories")
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess)
      puts res.body
      @categories = JSON.parse(res.body)
    end

    cat_uri = URI("#{ApplicationRecord::API_ADDRESS}/random?category=#{params[:any][:category]}")
    cat_res = Net::HTTP.get_response(cat_uri)
    if cat_res.is_a?(Net::HTTPSuccess)
      puts cat_res.body
      @category_fact = JSON.parse(cat_res.body)
      @category_fact = @category_fact['value']
    end
    extracted_search = params[:any][:category]
    render :turbo_frame_form, categories: @categories, status: :ok, locals: {category: extracted_search, comment: 'turbo_frame_submit ok' }
    @query = Query.new
  end
  
end