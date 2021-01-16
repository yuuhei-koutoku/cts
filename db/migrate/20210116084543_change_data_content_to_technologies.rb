class ChangeDataContentToTechnologies < ActiveRecord::Migration[5.2]
  def change
    change_column :technologies, :content, :text
  end
end
