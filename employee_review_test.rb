require 'minitest/autorun'
require 'minitest/pride'

require './employee.rb'
require './department.rb'
require './employee_migration.rb'
require './department_migration.rb'

require 'active_record'

ActiveRecord::Base.establish_connection(
 adapter: 'sqlite3',
 database: 'dbtest.sqlite3'
)

ActiveRecord::Migration.verbose = false

class EmployeeReview < Minitest::Test
  def setup
    EmployeeMigration.migrate(:up)
    DepartmentMigration.migrate(:up)
  end

  def teardown
    EmployeeMigration.migrate(:down)
    DepartmentMigration.migrate(:down)
  end


  def test_01_create_employee
    Employee.create(name: "Jennifer", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  end

  def test_02_call_on_employee_name
    assert_equal "Bob", Employee.create(name: "Bob", salary: 10000).name
  end

  def test_03_call_on_employee_emails
    assert_equal "hello@gmail.com", Employee.create(name: "Steve", email:"hello@gmail.com", salary: 1000).email
  end

  def test_04_call_on_employee_phone
    assert_equal "4048036666", Employee.create(name: "Steve", email: "hello@gmail.com", phone: 4048036666, salary: 1000).phone
  end

  def test_05_call_on_employee_salary
    assert_equal 1000, Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000).salary
  end

  def test_06_department_call_on_name
    assert_equal "Human Resources", Department.create(name: "Human Resources").name
  end

  def test_07_add_employee_to_department
    humanresources = Department.create(name: "Human Resources")
    assert humanresources.add_employee(Employee.create(name: "George",salary: 25000))
  end

  def test_08_all_employees_salaries_in_department
    finance = Department.create(name: "Finance")
    finance.add_employee(Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000))
    finance.add_employee(Employee.create(name: "George", salary: 25000))
    assert_equal 26000, finance.total_salaries
  end

  def test_09_add_raise_to_employee
    steve = Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    assert steve.give_raise(1000)
  end

  def test_10_add_raises_to_department
    assert finance = Department.create(name: "Finance")
    assert jim = Employee.create(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    assert finance.add_employee(jim)
    assert george = Employee.create(name: "George", salary: 25000)
    assert finance.add_employee(george)
    assert finance.give_raises(5000) {|employee| employee.salary < 100000}
  end

  def test_11_work_performance
    george = Employee.create(name: "George", salary: 25000)
    assert_equal  "Satisfactorily", george.work_performance(true)
  end

  def test_12_total_employees
    finance = Department.create(name: "Finance")
    finance.add_employee(Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000))
    finance.add_employee(Employee.create(name: "George", salary: 25000))
    assert_equal 2, finance.total_employees
  end

  def test_13_least_paid_employee
    finance = Department.create(name: "Finance")
    finance.add_employee(Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000))
    finance.add_employee(Employee.create(name: "George", salary: 25000))

    p finance.lowest_paid_employee

  end

  def test_14_sort_employee_names
    finance = Department.create(name: "Finance")
    finance.add_employee(Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000))
    finance.add_employee(Employee.create(name: "George", salary: 25000))
    finance.add_employee(Employee.create(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000))
    assert_equal ["George", "Jim", "Steve"], finance.sort_employee_names
  end

  def test_15_employee_salary_average
  end
end
