class QueriesController < ApplicationController
  def index
    @queries = Query.all.limit(20).order(id: :desc)
  end

  def show
    @query = Query.find(params[:id])
  end

  def create
    @query = GoogleSearch.new(params[:queries]).create
    redirect_to query_path(@query)

    respond_to do |format|
      format.html
      format.js
    end
  end
end
