require './employee.rb'
require './department.rb'
require './employee_migration.rb'


EmployeeMigration.migrate(:up)
DepartmentMigration.migrate(:up)

#comment
