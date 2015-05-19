require './setup.rb'

class EmployeeMigration<ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :department_id
      t.string :email
      t.string :number
<<<<<<< HEAD
<<<<<<< HEAD
      t.decimal :salary #precision: 2, scale: 10
=======
      # t.decimal :salary precision: 2, scale: 10
>>>>>>> 932c3d140f471e9f2bd097c303fa23dcfa43f179
=======
      t.integer :salary
      # t.decimal :salary :precision 2, :scale 10
>>>>>>> 9ecdffe7565c61f1971f912b2e60ddc3b150e0d7
      t.string :review
    end
  end
end
