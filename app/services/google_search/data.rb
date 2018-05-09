class GoogleSearch::Data
  require 'net/http'
  require 'json'

  def initialize(string:, count:)
    @string = string
    @count = count
    @result = []
  end

  def data
    if modulo > 0
      take_dates + modulo_results
    else
      take_dates
    end
  end

  private

  def take_dates
    count.times do |i|
      offset = i * 10 + 1
      url = GoogleSearch::BuildUrl.new(string: @string, count: 10, offset: offset).build
      @result += json_response(url)
    end
    @result
  end

  def modulo_results
    url = GoogleSearch::BuildUrl.new(string: @string, count: modulo, offset: count * 10 + 1).build
    json_response(url)
  end

  def json_response(url)
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data_hash = JSON.parse(response)
    data_hash['items']
  end

  def count
    @count / 10
  end

  def modulo
    @count % 10
  end
end
