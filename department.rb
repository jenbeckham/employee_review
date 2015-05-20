require './setup.rb'

class Department < ActiveRecord::Base
  has_many :employees

  def add_employee(employee)
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

  def total_employees
    employees.count
  end

  def lowest_paid_employee
    # salaries = self.employees.map {|e| e}
    # #salaries = salaries.sort {|e,f|e <=> f}
    # salaries
    employees.order(:salary).first.name

  end

  def sort_employee_names
    names = employees.map {|e| e.name}
    names.sort
  end

  def employee_salary_average
    self.total_salaries/employees.count

  end

  def alphabatize
    alphabatize = self.employees.map {|e| e.name}
    sorted_names = alphabatize.sort {|e,f|e<=>f}
    sorted_names[0]
  end

  def a_method
    names = employees.each {|e| e.name}
  if  names == names.reverse
    return names
  else
    return "sorry"
  end
  end

end
