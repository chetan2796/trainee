class AddAttributeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :address, :string
    add_column :users, :role, :string
    add_column :users, :gender, :string
  end
end
