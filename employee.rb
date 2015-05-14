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

  def give_raise(ratio)
    @salary + (ratio*@salary)
  end

  def add_review(review)
    @reviews << review
  end

  def work_performance(r)
    if r == true
      @performance_rating = "Satisfactorily"
    else
      @performance_rating = "Unsatisfactorily"
    end
  end
end
