class Employee
  attr_reader :name, :email, :phone, :salary, :reviews, :performance_rating, :bad_comments
  def initialize (name:, email: "", phone: "", salary:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @reviews = []
    @performance_rating = performance_rating
    @bad_comments = []
    # @good_comments = [/(good)|(success)|(pleasure)|(happy)|(great)|(consistent)|(effectiv)|(\s\satisf)|(\s\productiv)|(\s\perfect)|(outstand)|(excellent)|(postive)|(s\proficient)|(strong)/]
    @good_comments = []
  end

  def give_raise(dollar_amount)
    @salary + (dollar_amount+@salary)
  end

  def add_review(review)
    @reviews << review.downcase
  end

  def evaluate_employee_review
    @bad_comments = bad_comments
    @reviews.each do |r|
    bad_comments << r.scan(/(improve|difficult|negative|less|not|lack|inadequate|concern|interrupt|poor|needs|unsatisf|\s\more\s\w)/).flatten
    end
    p bad_comments.flatten.count

    # , /(negative)/, /(less)/, /(not)/, /(lack)/, /(inadequate)/, /(concern)/, /(interrupt)/, /(poor)/, /(needs)/, /(unsatisf)/, /(\s\more\s\w)/)}
    # @bad_comments << r.scan(/(improve)+(difficult)+(negative)+(less)+(not)+(lack)+(inadequate)+(concern)+(interrupt)+(poor)+(needs)+(unsatisf)+(\s\more\s\w)/)

    # r.scan(/(improve)+(difficult)+(negative)+(less)+(not)+(lack)+(inadequate)+(concern)+(interrupt)+(poor)+(needs)+(unsatisf)+(\s\more\s\w)/)
    #  {|comment| @good_comments[comment] += 1} # @bad_comments =  @reviews.count(/(improve)(difficult)(negative)(less)(not)(lack)(inadequate)(concern)(interrupt)(poor)(needs)(unsatisf)(\s\more\s\w)/)
    # @reviews.scan()
    #   r.scan(/(good)|(success)|(pleasure)|(happy)|(great)|(consistent)|(effectiv)|(\s\satisf)|(\s\productiv)|(\s\perfect)|(outstand)|(excellent)|(postive)|(s\proficient)|(strong)/)}
    # p @good_comments
    # bad_comments = @bad_comments
    # p good_comments
    # p bad_comments
      # if @good_comments.count > @bad_comments.count
      #   @performance_rating = "Satisfactorily"
      # else
      #   @performance_rating = "Unsatisfactorily"
      # end
  end

  # def rating_employee_performance
  #   if @good_comments.count/(@good_comments.count+@bad_comments.count) <= 0.25
  #     "1"
  #   elsif @good_comments.count/(@good_comments.count+@bad_comments.count) <= 0.5
  #     "2"
  #   elsif @good_comments.count/(@good_comments.count+@bad_comments.count) <= 0.75
  #     "3"
  #   else
  #     "4"
  #   end
  # end

  def work_performance_status
  end


  # def work_performance(r)
  #   # @reviews
  #   if r == true
  #     @performance_rating = "Satisfactorily"
  #   else
  #     @performance_rating = "Unsatisfactorily"
  #   end
  # end
end
