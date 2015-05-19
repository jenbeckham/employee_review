require './setup.rb'

class Department < ActiveRecord::Base
  has_many :employees

  def add_e(employee)
    employees << employee
  end

  def total_salaries
    total_salaries = 0
      employees.map {|e| total_salaries += e.salary}
    total_salaries
  end

  def give_raises(amount)
    eligible_employees = employees.select {|e| yield (e)}
    eligible_employees.map {|employee| employee.give_raise(amount.to_f/eligible_employees.count)}
  end


end
