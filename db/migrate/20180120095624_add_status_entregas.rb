class AddStatusEntregas < ActiveRecord::Migration
  def change
    add_column :entregas, :status, :string
  end
end
