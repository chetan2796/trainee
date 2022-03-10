class AddEmployeeRefToTopics < ActiveRecord::Migration[6.1]
  def change
    add_reference :topics, :employee, null: false, foreign_key: true
  end
end
