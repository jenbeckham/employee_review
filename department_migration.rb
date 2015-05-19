require './setup.rb'

class DepartmentMigration<ActiveRecord::Migration
  def change
    create_table :employees
      t.string :name
      t.string :email
      t.string :number
      t.decimal :salary :precision :scale (2, 10)
      t.string :review
  end
end
