class Department
  attr_reader :name, :all_employees
  def initialize(name)
    @name = name
    @all_employees = []
  end

  def add_e(employee)
    @all_employees << employee
  end

  def total_salaries
    total_salaries = 0
    @all_employees.map {|e| total_salaries += e.salary}
    total_salaries
  end

  def give_raises(amount)
    eligible_employees = @all_employees.select {|e| yield (e)}
    eligible_employees.map {|employee| employee.give_raise(amount.to_f/eligible_employees.count)}
  end


end
