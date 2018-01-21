class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.string :description
      t.string :user_id
      t.string :video_url
      t.string :short_description
      t.timestamps null: false
    end
  end
end
