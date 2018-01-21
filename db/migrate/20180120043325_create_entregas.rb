class CreateEntregas < ActiveRecord::Migration
  def change
    create_table :entregas do |t|
      t.string :user_id
      t.string :demand_id
      t.string :repository_link
      t.string :description
      t.string :title
      t.string :score
      t.timestamps null: false
    end
  end
end
