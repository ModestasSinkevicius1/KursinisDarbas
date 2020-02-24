class CreateDalykas < ActiveRecord::Migration[6.0]
  def change
    create_table :dalykas do |t|
      t.integer :user_id
	  t.string :name
      t.string :program
      t.string :lecturer
      t.integer :course
      t.integer :credit
      t.string :group
      t.string :duration_start
	  t.string :duration_end
      t.string :description
	  
      t.timestamps
    end
  end
end
