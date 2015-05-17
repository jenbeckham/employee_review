class Employee
  attr_reader :name, :email, :phone, :salary, :reviews, :performance_rating
  def initialize (name:, email: "", phone: "", salary:)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @reviews = []
    @performance_rating = performance_rating
  end

  def give_raise(dollar_amount)
    @salary + (dollar_amount+@salary)
  end

  def add_review(review)
    @reviews << review
  end

  def evaluate_employee_review
    bad_comments =  @reviews.each {|r| r.scan(/(improve)|(difficult)|(negative)|(less)|(not)|(lack)/)}
    good_comments = @reviews.each {|r| r.scan(/(good)|())
      if good_comments.count > bad_comments.count
        @performance_rating = "Satisfactorily"
      else
        @performance_rating = "Unsatisfactorily"

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
