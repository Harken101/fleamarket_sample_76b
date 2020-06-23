class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name,          null: false
      t.string :first_name,           null: false
      t.string :furigana_family_name, null: false
      t.string :furigana_first_name,  null: false
      t.string :zipcode,              null: false
      t.integer :prefecture,          null: false
      t.string :city,                 null: false
      t.string :street,               null: false
      t.string :mansion
      t.string :tell
      t.references :user,             foreign_key: true

      t.timestamps

    end
  end
end
