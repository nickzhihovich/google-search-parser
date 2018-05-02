class GoogleSearch::BuildUrl
  def initialize(string:, count:, offset:)
    @string = string
    @count = count
    @offset = offset
  end

  def build
    'https://www.googleapis.com/customsearch/v1?' + params.to_query
  end

  private

  def params
    {
      q: @string,
      num: @count,
      start: @offset,
      cx: ENV['GOOGLE_CX'],
      key: ENV['GOOGLE_KEY']
    }
  end
end
