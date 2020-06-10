class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :status, null: false
      t.integer :price, null: false
      t.integer :payer, null: false
      t.integer :preday, null: false
      t.boolean :sold, default: true
      t.references :user
      t.references :postage_type
      t.references :category
      t.references :prefecture, null: false
      t.timestamps
    end
  end
end
