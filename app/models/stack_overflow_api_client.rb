require 'json'

class StackOverflowApiClient
  def initialize(query)
    @escaped_query = URI.escape(query)
    get_and_parse_page
  end

  def get_and_parse_page
    api_url = "https://api.stackexchange.com/2.2/search/advanced?page=1&pagesize=3&order=desc&sort=relevance&q=#{@escaped_query}&tagged=ruby&site=stackoverflow"
    page = open(api_url) { |page| page.read }
    parsed_page = JSON.parse(page)
    length = parsed_page["items"].length
    length = 3 if length > 3
    if length == 0
      @top_results = [{ title: "Stack Overflow", link: "http://stackoverflow.com/"}.to_json]
    else
      @top_results = parsed_page["items"][0..(length - 1)] #only looks at first three results for now
    end
  end

  def title
    titles = []
    @top_results.each do |result|
      titles << result["title"].gsub("&quot;", "'")
    end
    return titles
  end

  def link
    links = []
    @top_results.each do |result|
      links << result["link"]
    end
    return links
  end

  def results
    title
    link
    results = []
    i = 0
    title.length.times do
      results << StackOverflowResult.new(title[i], link[i])
      i += 1
    end
    return results
  end
end

