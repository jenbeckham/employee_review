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

  def raises(ratio)
    @all_employees.map {|e| e.give_raise(ratio)}
  end


end
