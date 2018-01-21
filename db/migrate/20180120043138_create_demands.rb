class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :name
      t.string :description
      t.string :value
      t.string :rules
      t.string :user_id
      t.string :image_path
      t.string :short_description
      
      t.timestamps null: false
    end
  end
end
