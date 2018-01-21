class AddTipoToDemand < ActiveRecord::Migration
  def change
    add_column :demands, :tipo, :string
  end
end
