require './setup.rb'

class DepartmentMigration<ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
<<<<<<< HEAD
      t.integer :salaries 
=======
      t.integer :salaries
      # :precision :scale (2, 10)
    end
>>>>>>> 932c3d140f471e9f2bd097c303fa23dcfa43f179
  end
end
