class CreateEmployee < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :role
      t.string :gender

      t.timestamps
    end
  end
end
