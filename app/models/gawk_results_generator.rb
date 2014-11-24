class GawkResultsGenerator
  def initialize(gawk)
    @gawk = gawk
  end

  def find_solutions
    error_class_results = StackOverflowApiClient.new(@gawk.error_class).results
    message_results = StackOverflowApiClient.new(@gawk.message).results
    [error_class_results, message_results]
  end

  def save_solutions # This hsoudl be split into tow methods, save messages and save classes - GawksController
    class_errors = find_solutions[0]
    message_errors = find_solutions[1]
    class_errors.each do |class_error|
      @gawk.results.create!(url: class_error.url, title: class_error.title, classification: "class")
    end
    message_errors.each do |message_error|
      @gawk.results.create!(url: message_error.url, title: message_error.title, classification: "message")
    end
  end
end
