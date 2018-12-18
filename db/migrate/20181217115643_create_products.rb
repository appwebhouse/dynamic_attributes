class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ''
      t.jsonb :properties, null: false, default: {}
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
