class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :description
      t.string :issues
      t.datetime :date
      t.string :source

      t.timestamps
    end
  end
end
