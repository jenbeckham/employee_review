require './setup.rb'

class DepartmentMigration<ActiveRecord::Migration
  def change
    create_table :departments
      t.string :name
      t.decimal :salaries :precision :scale (2, 10)
  end
end
