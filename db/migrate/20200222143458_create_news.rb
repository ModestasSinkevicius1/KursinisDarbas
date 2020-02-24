class CreateNews < ActiveRecord::Migration[6.0]
  def change
    create_table :news do |t|
      t.string :user
      t.string :email
      t.date :date
      t.string :description

      t.timestamps
    end
  end
end
