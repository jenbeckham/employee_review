require './setup.rb'

class EmployeeMigration<ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :department_id
      t.string :email

      t.string :phone
      t.integer :salary
      t.string :review
    end
  end
end
