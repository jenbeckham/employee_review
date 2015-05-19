require './setup.rb'

class DepartmentMigration<ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      # t.integer :salaries
    end
  end
end
