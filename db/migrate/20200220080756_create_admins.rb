class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :surname
      t.string :phone

      t.timestamps
    end
  end
end
