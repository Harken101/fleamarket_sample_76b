class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :status, defalut: 0
      t.integer :price
      t.integer :payer, defalut: 0
      t.integer :preday, defalut: 0
      t.boolean :sold, default: true
      t.references :user, foreign_key: true
      t.references :postage_type
      t.references :category
      t.integer :prefecture_id
      t.timestamps
    end
  end
end
