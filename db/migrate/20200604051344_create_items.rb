class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.integer :status, defalut: 0
      t.integer :price
      t.integer :payer
      t.integer :preday, defalut: 0
      t.boolean :sold, default: true
      t.references :user
      t.references :postage_type
      t.references :category
      t.references :prefecture
      t.timestamps
    end
  end
end
