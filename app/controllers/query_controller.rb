class QueryController < ApplicationController

  def new
    @query = Query.new
  end

  def create
    @query = Query.new(params[:query])
    
  end
  
  private
  def query_params
    params.require(:query).permit(:query, :mail, :results: [])
  end

end