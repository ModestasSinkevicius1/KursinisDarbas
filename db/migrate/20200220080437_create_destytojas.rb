class CreateDestytojas < ActiveRecord::Migration[6.0]
  def change
    create_table :destytojas do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :program

      t.timestamps
    end
  end
end
