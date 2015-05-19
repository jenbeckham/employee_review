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


  def test_02_create_employee
    Employee.create(name: "Jennifer", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  end

  def test_03_call_on_employee_name
    assert_equal "Bob", Employee.create(name: "Bob", salary: 10000).name
  end

  def test_04_call_on_employee_emails
    assert_equal "hello@gmail.com", Employee.create(name: "Steve", email:"hello@gmail.com", salary: 1000).email
  end

  def test_05_call_on_employee_phone
    assert_equal "4048036666", Employee.create(name: "Steve", email: "hello@gmail.com", phone: 4048036666, salary: 1000).phone
  end

  def test_06_call_on_employee_salary
    assert_equal 1000, Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000).salary
  end

  def test_07_department_call_on_name
    assert_equal "Human Resources", Department.create(name: "Human Resources").name
  end

  def test_08_add_employee_to_department
    humanresources = Department.create(name: "Human Resources")
    assert humanresources.add_e(Employee.create(name: "George",salary: 25000))
  end

  def test_09_all_employees_salaries_in_department
    finance = Department.create(name: "Finance")
    finance.add_e(Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000))
    finance.add_e(Employee.create(name: "George", salary: 25000))
    assert_equal 26000, finance.total_salaries
  end

  def test_13_add_raise_to_employee
    steve = Employee.create(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    assert steve.give_raise(1000)
  end

  def test_15_add_raises_to_department
    assert finance = Department.create(name: "Finance")
    assert jim = Employee.create(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000)
    assert finance.add_e(jim)
    assert george = Employee.create(name: "George", salary: 25000)
    assert finance.add_e(george)
    assert finance.give_raises(5000) {|employee| employee.salary < 100000}
  end

  def test_16_work_performance
    george = Employee.create(name: "George", salary: 25000)
    assert_equal  "Satisfactorily", george.work_performance(true)
  end

end
