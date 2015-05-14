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

  def give_raises(ratio)
    good_employees = []
    @all_employees.each do |e|
      if e.work_performance(true)
        good_employees << e
      end
    end

    #
    # @all_employees.reject {|e| e.work_performance(false)}
    # good_employees
    # good_employees.map {|ge| ge.give_raise(ratio)}

  end


end
