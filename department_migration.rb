require './setup.rb'

class DepartmentMigration<ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :salaries
      # :precision :scale (2, 10)
    end
  end
end
