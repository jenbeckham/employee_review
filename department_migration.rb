require './setup.rb'

class DepartmentMigration<ActiveRecord::Migration
  def change
    create_table :departments
      t.string :name
      t.integer :salaries 
  end
end
