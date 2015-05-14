require './employee.rb'
require './department.rb'

finance = Department.new("Finance")
jim = Employee.new(name: "Jim", email: "hello@gmail.com", phone: 404803666, salary: 1000)
finance.add_e(jim)
jim.work_performance(true)
george = Employee.new(name: "George", salary: 25000)
finance.add_e(george)
george.work_performance(false)
p finance.give_raises(0.25)
