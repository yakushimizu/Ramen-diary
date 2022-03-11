class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :shop_name
      t.string :address
      t.integer :user_id
      t.timestamps
    end
  end
end
