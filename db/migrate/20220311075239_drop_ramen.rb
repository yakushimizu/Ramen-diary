class DropRamen < ActiveRecord::Migration[6.1]
  def change
    drop_table :ramen
  end
end
