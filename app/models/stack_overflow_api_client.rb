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
    if parsed_page["items"].length == 0
      @first_result = { title: "Stack Overflow", link: "http://stackoverflow.com/"}.to_json
    else
      @first_result = parsed_page["items"][0] #only looks at first result for now
    end
  end

  def title
    @first_result["title"].gsub("&quot;", "'")
  end

  def link
    @first_result["link"]
  end

  def results
    StackOverflowResult.new(title, link)
    # this will be required when getting more than one result from #get_and_parse_page
    # results.map{|result| StackOverflowResult.new(result)}
  end
end

