require 'net/http'
require 'json'
 
class Recipe

  def self.search(search)
    results = []
    # hack to get 20 results
    (1..2).each do |i|
      url = "http://www.recipepuppy.com/api/?q=#{search}&p=#{i}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)
      results.concat(data["results"])
    end

    results.uniq{ |hash| hash["title"] }
  end
end