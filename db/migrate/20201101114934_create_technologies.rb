class CreateTechnologies < ActiveRecord::Migration[5.2]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :title
      t.text :content
      t.string :company

      t.timestamps
    end
  end
end
