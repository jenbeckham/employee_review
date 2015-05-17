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

  # def test_12_employee_work_performance
  #   danny = Employee.new(name: "Danny", salary: 35000)
  #   assert_equal "Satisfactorily", danny.work_performance(true)
  #   alex = Employee.new(name: "Alex", salary: 12000)
  #   assert_equal "Unsatisfactorily", alex.work_performance(false)
  # end

  def test_13_add_raise_to_employee
    steve = Employee.new(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    assert steve.give_raise(1000)
  end

  # def test_14_add_department_raises_by_ratio
  #   finance = Department.new("Finance")
  #   jim = Employee.new(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  #   finance.add_e(jim)
  #   assert jim.work_performance(true)
  #   george = Employee.new(name: "George", salary: 25000)
  #   finance.add_e(george)
  #   assert george.work_performance(false)
  #   assert finance.give_raises(1000)
  # end

  def test_15_add_raises_to_department
    finance = Department.new("Finance")
    jim = Employee.new(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    finance.add_e(jim)
    george = Employee.new(name: "George", salary: 25000)
    finance.add_e(george)
    finance.give_raises(5000) {|employee| employee.salary < 100000}
  end

  def test_16_evaluate_employee_review
    zeke = Employee.new(name: "Zeke", salary: 15000)
    zeke.add_review("Zeke is a very positive person and encourages those around him,
    but he has not done well technically this year.  There are two areas in which Zeke
    has room for improvement.  First, when communicating verbally (and sometimes in
    writing), he has a tendency to use more words than are required.  This conversational
    style does put people at ease, which is valuable, but it often makes the meaning difficult
    to isolate, and can cause confusion.Second, when discussing new requirements with project
    managers, less of the information is retained by Zeke long-term than is expected.  This
    has a few negative consequences: 1) time is spent developing features that are not useful
    and need to be re-run, 2) bugs are introduced in the code and not caught because the tests
    lack the same information, and 3) clients are told that certain features are complete when
    they are inadequate.  This communication limitation could be the fault of project management,
    but given that other developers appear to retain more information, this is worth discussing further.")
    assert zeke.evaluate_employee_review
  end

end
