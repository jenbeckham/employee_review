require './setup.rb'

class Employee < ActiveRecord::Base
  belongs_to :departments

  def give_raise(dollar_amount)
    self.salary += dollar_amount
  end

  def work_performance(review)
    if review == true
      "Satisfactorily"
    else
      "Unsatisfactorily"
    end
  end

end
