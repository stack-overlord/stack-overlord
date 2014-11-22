class GawkResultsGenerator
  def initialize(gawk)
    @gawk = gawk
  end

  def find_solutions
    # binding.pry
    error_class_results = StackOverflowApiClient.new(@gawk.error_class).results
    message_results = StackOverflowApiClient.new(@gawk.message).results
    [error_class_results, message_results]
    # only for multiple results
    # (error_class_results + message_results).uniq
  end

  def save_solutions
    find_solutions.each {|solution| @gawk.results.create(solution.attributes)}
  end
end
