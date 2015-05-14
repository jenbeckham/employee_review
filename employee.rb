class Employee
  attr_reader :name, :email, :phone, :salary, :reviews
  def initialize (name, email = "", phone = "", salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @reviews = []
  end

  def give_raise(ratio)
    @salary + (ratio*@salary)
  end

  def add_review(review)
    @reviews << review
  end

  def work_performance(r)
    if r == true
      "Satisfactorily"
    else
      "Unsatisfactorily"
    end
  end
end
