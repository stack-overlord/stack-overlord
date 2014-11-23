class GawkResultsGenerator
  def initialize(gawk)
    @gawk = gawk
  end

  def find_solutions
    error_class_results = StackOverflowApiClient.new(@gawk.error_class).results
    message_results = StackOverflowApiClient.new(@gawk.message).results
    array = [error_class_results, message_results]
    return array
  end

  def save_solutions
    array = find_solutions
    array.flatten!
    array.each {|solution| @gawk.results.create(solution.attributes)}
  end
end
