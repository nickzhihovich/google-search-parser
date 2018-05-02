class GoogleSearch::Result
  def initialize(response:, keyword:)
    @keyword = keyword
    @response = response
  end

  def result
    {
      provider: 'Google',
      keyword: @keyword,
      items: items
    }
  end

  private

  def items
    @response.map do |item|
      {
        website: item['displayLink'],
        full_link: item['link'],
        position: @response.index(item) + 1
      }
    end
  end
end
