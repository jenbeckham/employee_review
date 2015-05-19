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
    salaries = self.employees.map {|e| e.salary}
    salaries.sort[0]

    # employees.each do |e|
    #   hash[e.salary => e.name]
    # end
    # p hash[salaries.sort[0]]
  end

  def sort_employee_names
    names = employees.map {|e| e.name}
    names.sort
  end

end
