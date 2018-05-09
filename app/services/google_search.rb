class GoogleSearch < Struct.new(:string)
  def create
    Creator.new(result).create
  end

  private

  def result
    GoogleSearch::Result.new(response: response, keyword: string).result
  end

  def response
    GoogleSearch::Data.new(string: string, count: 50).data
  end
end

