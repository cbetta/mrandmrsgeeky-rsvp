class AddsPlusOnes < ActiveRecord::Migration
  def change
    add_column :guests, :plus_one_name, :string
  end
end
