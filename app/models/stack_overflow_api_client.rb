require 'json'

class StackOverflowApiClient
  def initialize(query)
    escaped_query = URI.escape(query)
    @api_url = "https://api.stackexchange.com/2.2/search/advanced?page=1&pagesize=3&order=desc&sort=relevance&q=#{escaped_query}&tagged=ruby&site=stackoverflow"
    get_and_parse_page
  end

  def get_and_parse_page
    page = open(@api_url) {|page| page.read }
    @parsed_page = JSON.parse(page)["items"][0]#only looks at first result for now
  end

  def title
    @parsed_page["title"].gsub("&quot;", "'")
  end

  def link
    @parsed_page["link"]
  end

  def results
    StackOverflowResult.new(title, link)
    # this will be required when getting more than one result from #get_and_parse_page
    # results.map{|result| StackOverflowResult.new(result)}
  end
end



