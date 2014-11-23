class GawkResultsGenerator
  def initialize(gawk)
    @gawk = gawk
  end

  def find_solutions
    error_class_results = StackOverflowApiClient.new(@gawk.error_class).results
    message_results = StackOverflowApiClient.new(@gawk.message).results
    array = [error_class_results, message_results]
    array = array.transpose
    return array
    # only for multiple results
    # (error_class_results + message_results).uniq
  end

  def save_solutions
    array = find_solutions
    array.each {|solution| @gawk.results.create(solution[0].attributes)}
  end

  # def find_all_solutions(gawk_array)
  #   gawk_array.each{|solution| solution.save_solution }
  # end
end
