class CreateStudentas < ActiveRecord::Migration[6.0]
  def change
    create_table :studentas do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :group
      t.integer :course
      t.string :program

      t.timestamps
    end
  end
end
