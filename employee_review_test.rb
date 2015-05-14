require 'minitest/autorun'
require 'minitest/pride'

require './employee.rb'
require './department.rb'

class EmployeeReview < Minitest::Test
  def test_01_employee_class_exist
    assert Employee
  end

  def test_02_create_employee
    assert Employee.new(name: "Jennifer", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  end

  def test_03_call_on_employee_name
    assert_equal "Bob", Employee.new(name: "Bob", salary: 10000).name
  end

  def test_04_call_on_employee_emails
    assert_equal "hello@gmail.com", Employee.new(name: "Steve", email:"hello@gmail.com", salary: 1000).email
  end

  def test_05_call_on_employee_phone
    assert_equal 4048036666, Employee.new(name: "Steve", email: "hello@gmail.com", phone: 4048036666, salary: 1000).phone
  end

  def test_06_call_on_employee_salary
    assert_equal 1000, Employee.new(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000).salary
  end

  def test_07_department_call_on_name
    assert_equal "Human Resources", Department.new("Human Resources").name
  end

  def test_08_add_employee_to_department
    humanresources = Department.new("Human Resources")
    assert humanresources.add_e(Employee.new(name: "George",salary: 25000))
  end

  def test_09_all_employees_salaries_in_department
    finance = Department.new("Finance")
    finance.add_e(Employee.new(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000))
    finance.add_e(Employee.new(name: "George", salary: 25000))
    assert_equal 26000, finance.total_salaries
  end

  def test_10_add_employee_review
    abbie = Employee.new(name: "Abbie", salary: 35000)
    assert abbie.add_review("Great attitude! Needs to work on meeting deadlines.")
  end

  def test_11_employee_add_review
    danny = Employee.new(name: "Danny", salary: 35000)
    assert danny.add_review("Great Job!")
    assert danny.add_review("Needs improvement in time management")
    assert danny.add_review("Exceeds performance expectations")
  end

  def test_12_employee_work_performance
    danny = Employee.new(name: "Danny", salary: 35000)
    assert_equal "Satisfactorily", danny.work_performance(true)
    alex = Employee.new(name: "Alex", salary: 12000)
    assert_equal "Unsatisfactorily", alex.work_performance(false)
  end

  def test_12_add_raise_to_employee
    steve = Employee.new(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    assert steve.give_raise(0.3)
  end

  def test_13_add_department_raise
    finance = Department.new("Finance")
    steve = Employee.new(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    finance.add_e(steve)
    steve.work_performance(true)
    george = Employee.new(name: "George", salary: 25000)
    finance.add_e(george)
    george.work_performance(false)
    finance.give_raises(0.25)
  #   p george.salary
  #   p steve.salary
  end

end
