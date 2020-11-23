class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :technology, foreign_key: true
      t.text :content
      t.string :company
      t.string :name

      t.timestamps
    end
  end
end
