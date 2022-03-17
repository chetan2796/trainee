class AddMentorIdToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :mentor_id, :integer, null: true 
  end
end
