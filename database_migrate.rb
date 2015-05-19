#require './employee.rb'
require './department_migration.rb'
require './employee_migration.rb'


EmployeeMigration.migrate(:up)
DepartmentMigration.migrate(:up)

#comment
