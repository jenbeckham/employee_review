require './setup.rb'

class EmployeeMigration<ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :department_id
      t.string :email
      t.string :number

      # t.decimal :salary precision: 2, scale: 10

      t.integer :salary
      # t.decimal :salary :precision 2, :scale 10
      t.string :review
    end
  end
end
