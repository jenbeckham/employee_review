<<<<<<< HEAD
#require './employee.rb'
require './department_migration.rb'
=======
# require './employee.rb'
# require './department.rb'
require './setup.rb'
>>>>>>> 932c3d140f471e9f2bd097c303fa23dcfa43f179
require './employee_migration.rb'
require './department_migration.rb'


EmployeeMigration.migrate(:up)
DepartmentMigration.migrate(:up)

#comment
