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


class EmployeeReview < Minitest::Test
  def setup
    EmployeeMigration.migrate(:up)
    DepartmentMigration.migrate(:up)
  end

  def teardown
    EmployeeMigration.migrate(:down)
    DepartmentMigration.migrate(:down)
  end

  # def test_01_employee_class_exist
  #   assert Employee
  # end

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

  # def test_08_add_employee_to_department
  #   humanresources = Department.new("Human Resources")
  #   assert humanresources.add_e(Employee.new(name: "George",salary: 25000))
  # end
  #
  # def test_09_all_employees_salaries_in_department
  #   finance = Department.new("Finance")
  #   finance.add_e(Employee.new(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000))
  #   finance.add_e(Employee.new(name: "George", salary: 25000))
  #   assert_equal 26000, finance.total_salaries
  # end
  #
  # def test_10_add_employee_review
  #   abbie = Employee.new(name: "Abbie", salary: 35000)
  #   assert abbie.add_review("Great attitude! Needs to work on meeting deadlines.")
  # end
  #
  # def test_11_employee_add_review
  #   danny = Employee.new(name: "Danny", salary: 35000)
  #   assert danny.add_review("Great Job!")
  #   assert danny.add_review("Needs improvement in time management")
  #   assert danny.add_review("Exceeds performance expectations")
  # end
  #
  # # def test_12_employee_work_performance
  # #   danny = Employee.new(name: "Danny", salary: 35000)
  # #   assert_equal "Satisfactorily", danny.work_performance(true)
  # #   alex = Employee.new(name: "Alex", salary: 12000)
  # #   assert_equal "Unsatisfactorily", alex.work_performance(false)
  # # end
  #
  # def test_13_add_raise_to_employee
  #   steve = Employee.new(name: "Steve", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  #   assert steve.give_raise(1000)
  # end
  #
  # # def test_14_add_department_raises_by_ratio
  # #   finance = Department.new("Finance")
  # #   jim = Employee.new(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  # #   finance.add_e(jim)
  # #   assert jim.work_performance(true)
  # #   george = Employee.new(name: "George", salary: 25000)
  # #   finance.add_e(george)
  # #   assert george.work_performance(false)
  # #   assert finance.give_raises(1000)
  # # end
  #
  # def test_15_add_raises_to_department
  #   assert finance = Department.new("Finance")
  #   assert jim = Employee.new(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  #   assert finance.add_e(jim)
  #   assert george = Employee.new(name: "George", salary: 25000)
  #   assert finance.add_e(george)
  #   assert finance.give_raises(5000) {|employee| employee.salary < 100000}
  #   p george.salary
  #   p jim.salary
  # end
  #
  # def test_16_evaluate_employee_review_and_rating
  #   zeke = Employee.new(name: "Zeke", salary: 15000)
  #   zeke.add_review("Zeke is a very positive person and encourages those around him,
  #   but he has not done well technically this year.  There are two areas in which Zeke
  #   has room for improvement.  First, when communicating verbally (and sometimes in
  #   writing), he has a tendency to use more words than are required.  This conversational
  #   style does put people at ease, which is valuable, but it often makes the meaning difficult
  #   to isolate, and can cause confusion.Second, when discussing new requirements with project
  #   managers, less of the information is retained by Zeke long-term than is expected.  This
  #   has a few negative consequences: 1) time is spent developing features that are not useful
  #   and need to be re-run, 2) bugs are introduced in the code and not caught because the tests
  #   lack the same information, and 3) clients are told that certain features are complete when
  #   they are inadequate.  This communication limitation could be the fault of project management,
  #   but given that other developers appear to retain more information, this is worth discussing further.")
  #   assert_equal "Unsatisfactorily",  zeke.evaluate_review
  #   assert zeke.rating_performance
  #   yvonne = Employee.new(name: "Yvonne", salary: 20000)
  #   yvonne.add_review("Thus far, there have been two concerns over Yvonne's performance, and
  #   both have been discussed with her in internal meetings.  First, in some cases, Yvonne takes
  #   longer to complete tasks than would normally be expected.  This most commonly manifests during
  #   development on existing applications, but can sometimes occur during development on new projects,
  #   often during tasks shared with Andrew.  In order to accommodate for these preferences, Yvonne has
  #   been putting more time into fewer projects, which has gone well. Second, while in conversation,
  #   Yvonne has a tendency to interrupt, talk over others, and increase her volume when in disagreement.
  #   In client meetings, she also can dwell on potential issues even if the client or other attendees have
  #   clearly ruled the issue out, and can sometimes get off topic.")
  #   assert_equal "Unsatisfactorily", yvonne.evaluate_review
  #   assert yvonne.rating_performance
  #   xavier = Employee.new(name: "Xavier", salary: 25000)
  #   xavier.add_review("Xavier is a huge asset to SciMed and is a pleasure to work with. He quickly knocks
  #   out tasks assigned to him, implements code that rarely needs to be revisited, and is always willing to
  #   help others despite his heavy workload.  When Xavier leaves on vacation, everyone wishes he didn't have
  #   to go. Last year, the only concerns with Xavier performance were around ownership.  In the past twelve months,
  #   he has successfully taken full ownership of both Acme and Bricks, Inc.  Aside from some false starts with estimates
  #   on Acme, clients are happy with his work and responsiveness, which is everything that his managers could ask for.")
  #   assert_equal "Satisfactorily",  xavier.evaluate_review
  #   assert xavier.rating_performance
  #   wanda = Employee.new(name: "Wanda", salary: 13000)
  #   wanda.add_review("Wanda has been an incredibly consistent and effective developer.  Clients are always satisfied with
  #    her work, developers are impressed with her productivity, and she's more than willing to help others even when she has
  #    a substantial workload of her own.  She is a great asset to Awesome Company, and everyone enjoys working with her.
  #    During the past year, she has largely been devoted to work with the Cement Company, and she is the perfect woman for
  #    the job.  We know that work on a single project can become monotonous, however, so over the next few months, we hope
  #    to spread some of the Cement Company work to others.  This will also allow Wanda to pair more with others and spread
  #    her effectiveness to other projects")
  #    assert_equal "Satisfactorily", wanda.evaluate_review
  #    wanda.rating_performance
  # end
  #
  # def test_17_give_raises_based_on_rating
  #   assert finance = Department.new("Finance")
  #   assert mike = Employee.new(name: "Mike", email: "hello@gmail.com", phone: 404803666, salary: 1000)
  #   assert finance.add_e(mike)
  #   assert mike.add_review("Mike displays very good verbal skills, communicating clearly and concisely.
  #   He exhibits good listening skills and comprehends complex matters well. His written communications
  #   skills meet the requirements of his position, and he keeps others adequately informed. However,
  #   Mike occasionally selects inappropriate methods of communication.")
  #   assert mike.evaluate_review
  #   assert mike.rating_performance
  #   assert sam = Employee.new(name: "Sam", salary: 25000)
  #   assert finance.add_e(sam)
  #   assert sam.add_review("Sam demonstrates outstanding written communications skills. She listens carefully,
  #   asks perceptive questions, and quickly comprehends new or highly complex matters. She implements
  #   highly effective and often innovative communication methods. Sam displays very good verbal skills,
  #   communicating clearly and concisely. She is careful to keep others informed in a timely manner.")
  #   assert sam.evaluate_review
  #   assert sam.rating_performance
  #   assert finance.give_raises(100) {|employee| employee.rating_performance. >= 3}
  #
  # end

end
