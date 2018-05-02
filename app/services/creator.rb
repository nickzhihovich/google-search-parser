class Creator < Struct.new(:params)
  def create
    query_create
    results_create
    @query
  end

  private

  def query_create
    @query = Query.create(
      keyword: params[:keyword],
      search_engine: params[:provider]
    )
  end

  def results_create
    @query.results.create(params[:items])
  end
end
