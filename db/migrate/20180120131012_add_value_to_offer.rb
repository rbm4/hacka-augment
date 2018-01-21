class AddValueToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :value, :string
  end
end
