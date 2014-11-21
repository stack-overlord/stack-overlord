class StackOverFlowClient
  attr_reader :query

  def initialize(query)
    @query = query
    @escaped_query = URI.escape(@query)
  end

  def make_stack_api_url
    "https://api.stackexchange.com/2.2/search/advanced?page=1&pagesize=3&order=desc&sort=relevance&q=#{@escaped_query}&tagged=ruby&site=stackoverflow"
  end

  def parse_stack_api
    open(make_stack_api_url) {|page| page.read }
  end

  def make_api_hash
    JSON.parse(parse_stack_api)["items"][0]#only looks at first result for now
  end

  def get_title
    make_api_hash["title"].gsub("&quot;", "'")
  end

  def get_link
    make_api_hash["link"]
  end

end
