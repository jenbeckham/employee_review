# require './employee.rb'
# require './department.rb'
require './setup.rb'
require './employee_migration.rb'
require './department_migration.rb'


EmployeeMigration.migrate(:up)
DepartmentMigration.migrate(:up)

#comment
